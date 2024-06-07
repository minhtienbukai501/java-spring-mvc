package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.service.CartService;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductClientController {
    private final ProductService productService;
    private final CartService cartService;

    public ProductClientController(ProductService productService, CartService cartService) {
        this.productService = productService;
        this.cartService = cartService;
    }

    @GetMapping("/product/{id}")
    public String getProductById(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);

        return "client/product/detail";
    }

    @PostMapping("/add-product-to-card/{id}")
    public String postMethodName(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long ProductId = id;
        String email = session.getAttribute("email").toString();
        this.productService.handleAddProductToCart(email, ProductId, session);

        return "redirect:/";
    }

    @PostMapping("/add-product-to-card-next/{id}")
    public String postHandleAddtoCart(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long ProductId = id;
        String email = session.getAttribute("email").toString();
        this.productService.handleAddProductToCart(email, ProductId, session);

        return "redirect:/product";
    }

    @GetMapping("/cart")
    public String showCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (Long) session.getAttribute("id");
        User user = new User();
        user.setId(id);
        Cart cart = this.cartService.getCartByUser(user);

        List<CartDetail> listCart = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        model.addAttribute("listCart", listCart);

        double totalPrice = 0;
        for (CartDetail cartDetail : listCart) {
            totalPrice += cartDetail.getQuantity() * cartDetail.getPrice();
        }

        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/show";
    }

    @PostMapping("/cart/{id}")
    public String postHandleDeleteProductFromCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

    @PostMapping("/product")
    public String postHandleSearchProduct(Model model, @RequestParam String search) {
        List<Product> listProduct = this.productService.findAllProductWithName(search);

        model.addAttribute("products", listProduct);
        return "client/product/show";
    }

}
