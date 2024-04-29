package vn.hoidanit.laptopshop.service.validator;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.DTO.LoginDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class LoginValidator implements ConstraintValidator<LoginChecked, LoginDTO> {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public LoginValidator(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean isValid(LoginDTO login, ConstraintValidatorContext context) {
        boolean valid = true;

        User user = this.userService.getUserWithEmail(login.getEmail());

        if (user == null) {
            context.buildConstraintViolationWithTemplate("email is invalid")
                    .addPropertyNode("email").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        } else {
            if (!this.passwordEncoder.matches(login.getPassword(), user.getPassWord())) {

                context.buildConstraintViolationWithTemplate("password is invalid")
                        .addPropertyNode("password").addConstraintViolation().disableDefaultConstraintViolation();
                valid = false;
            }

        }

        return valid;
    }
}
