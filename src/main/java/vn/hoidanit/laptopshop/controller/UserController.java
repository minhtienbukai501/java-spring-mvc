package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;

    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUserByEmail("minhtien501@gmail.com");
        System.out.println(listUser);
        return "hello";
    }

    @RequestMapping("/admin/user/create")
    public String getUserPage(Model model) {

        model.addAttribute("newUser", new User());
        model.addAttribute("hoidanit", "from controller with model");
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User leTien) {

        System.out.println("RunHere: " + leTien);
        this.userService.handleSaveUser(leTien);

        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getAllUser(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/user";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("id: " + id);
        model.addAttribute("id", id);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/userdetail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String handleUpdateUser(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("updateUser", user);

        return "admin/user/updateuser";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User u) {
        User user = this.userService.getUserById(u.getId());
        if (user != null) {
            user.setAddress(u.getAddress());
            user.setFullName(u.getFullName());
            user.setPhone(u.getPhone());
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";

    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable long id) {
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "/admin/user/deleteuser";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUserPost(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }
}