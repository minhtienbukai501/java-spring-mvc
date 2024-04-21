package vn.hoidanit.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

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
        return "/client/homepage/show";
    }

    @GetMapping("/register")
    public String handleCreateRegister(Model model) {

        model.addAttribute("newRegister", new RegisterDTO());
        return "/client/auth/register";
    }

    @PostMapping("/register")
    public String handleCreateRegisterPost(Model model, @ModelAttribute("newRegister") RegisterDTO register) {

        User user = this.userService.convertRegisterToUser(register);
        user.setPassWord(this.passwordEncoder.encode(register.getPassword()));
        user.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {

        return "/client/auth/login";
    }
}
