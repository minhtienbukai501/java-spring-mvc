package vn.hoidanit.laptopshop.service;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product insertNewProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void handleDeleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long id, HttpSession session) {
        User user = this.userService.getUserWithEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                cart = new Cart();
                cart.setUser(user);
                cart.setSum(0);
                this.cartRepository.save(cart);
            }

            Product product = this.productRepository.findById(id);
            if (product != null) {
                CartDetail cardDetail = this.cartDetailRepository.findByProductAndCart(product, cart);
                if (cardDetail != null) {
                    cardDetail.setQuantity(cardDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(cardDetail);
                    return;
                }
                cardDetail = new CartDetail();
                cardDetail.setCart(cart);
                cardDetail.setProduct(product);
                cardDetail.setPrice(product.getPrice());
                cardDetail.setQuantity(1);
                this.cartDetailRepository.save(cardDetail);
                cart.setSum(cart.getSum() + 1);
                session.setAttribute("sum", cart.getSum());
                System.out.println(cart.getSum() + 1);
                this.cartRepository.save(cart);
            }
        }

    }
}
