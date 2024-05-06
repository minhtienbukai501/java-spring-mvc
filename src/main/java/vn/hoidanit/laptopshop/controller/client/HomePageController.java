package vn.hoidanit.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import java.util.List;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;

import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);

        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String handleCreateRegister(Model model) {

        model.addAttribute("newRegister", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleCreateRegisterPost(Model model, @ModelAttribute("newRegister") @Valid RegisterDTO register,
            BindingResult productBindingResult) {

        if (productBindingResult.hasErrors()) {
            // System.out.println("Có lỗi");
            // List<FieldError> errors = productBindingResult.getFieldErrors();
            // for (FieldError error : errors) {
            // System.out.println(error.getField() + " - " + error.getDefaultMessage());
            // }
            return "client/auth/register";
        }

        User user = this.userService.convertRegisterToUser(register);
        user.setPassword(this.passwordEncoder.encode(register.getPassword()));
        user.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {

        return "client/auth/login";
    }

    @PostMapping("/login")
    public String getLoginPost(Model model) {
        // TODO: process POST request

        return "redirect:/";
    }

    @GetMapping("/product")
    public String getListProduct(Model model) {
        return "client/product/show";
    }

    @GetMapping("/acces-deny")
    public String getErrPage(Model model) {
        return "client/auth/deny";
    }

    @PostMapping("/keywords")
    public String findProductByKeyWords(Model model) {
        // TODO: process POST request

        return "redirect:/";
    }

}
