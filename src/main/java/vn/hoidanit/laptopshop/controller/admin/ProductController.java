package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String handleShowProduct(Model model) {
        List<Product> listProduct = this.productService.getAllProduct();
        model.addAttribute("listProduct", listProduct);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String handleCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProductPost(Model model, @Valid @ModelAttribute("newProduct") Product product,
            BindingResult productBindingResult, @RequestParam("productImage") MultipartFile fileProductName) {

        List<FieldError> errors = productBindingResult.getFieldErrors();
        String fileProduct = this.uploadService.handleSaveUploadFile(fileProductName, "product");
        String uploadFileErr = "";
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (productBindingResult.hasErrors() || fileProduct.compareTo("") == 0) {
            uploadFileErr = "File Name is Empty";
            model.addAttribute("uploadFileErr", uploadFileErr);

            return "/admin/product/create";
        }

        product.setImage(fileProduct);
        this.productService.insertNewProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String handleUpdateProduct(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("newProduct", product);
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProductPost(Model model, @Valid @ModelAttribute("newProduct") Product product,
            BindingResult productBindingResult,
            @RequestParam("productImage") MultipartFile fileProductName) {
        String imgProduct = this.uploadService.handleSaveUploadFile(fileProductName, "product");
        Product pr = this.productService.getProductById(product.getId());
        if (imgProduct.compareToIgnoreCase("") == 0) {

            imgProduct = pr.getImage();

        }
        product.setImage(imgProduct);

        if (productBindingResult.hasErrors()) {

            return "/admin/product/update";
        }

        this.productService.insertNewProduct(product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String handleDeleteProduct(Model model, @PathVariable Long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "/admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String handleDeteteProductPost(Model model, @ModelAttribute("product") Product product) {
        // TODO: process POST request
        this.productService.handleDeleteProductById(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String handleShowDetailProduct(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "/admin/product/detail";
    }
}
