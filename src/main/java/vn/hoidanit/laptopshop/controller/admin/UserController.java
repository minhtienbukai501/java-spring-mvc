package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user/create")
    public String getUserPage(Model model) {

        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User leTien, BindingResult userBindingResult,
            @RequestParam("nameFile") MultipartFile file) {

        List<FieldError> errors = userBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (userBindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        String fileAvatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(leTien.getPassword());
        leTien.setAvatar(fileAvatar);
        leTien.setPassword(hashPassword);
        leTien.setRole(this.userService.getRoleByName(leTien.getRole().getName()));
        this.userService.handleSaveUser(leTien);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user")
    public String getAllUser(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("id: " + id);
        model.addAttribute("id", id);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String handleUpdateUser(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("updateUser", user);

        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User u,
            @RequestParam("nameFileUpdate") MultipartFile file) {
        User user = this.userService.getUserById(u.getId());
        if (user != null) {
            user.setAddress(u.getAddress());
            user.setFullName(u.getFullName());
            user.setPhone(u.getPhone());
            user.setRole(this.userService.getRoleByName(u.getRole().getName()));
            String fileAvatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            if (fileAvatar.compareTo("") != 0) {
                user.setAvatar(fileAvatar);
            }

            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";

    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable long id) {
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUserPost(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }

}