package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.hoidanit.laptopshop.domain.Product;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {

    @GetMapping("/admin/product")
    public String handleShowProduct() {
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String handleCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProductPost(@ModelAttribute("newProduct") Product product) {
        return "redirect:/admin/product";
    }

}
