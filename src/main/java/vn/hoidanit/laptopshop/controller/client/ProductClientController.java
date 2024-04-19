package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductClientController {
    @GetMapping("/product/{id}")
    public String getProductById(@PathVariable Long id) {
        System.out.println(id);
        return "/client/product/detail";
    }
}
