package vn.hoidanit.laptopshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        if (user.getConfirmPassword().compareTo("") == 0) {
            context.buildConstraintViolationWithTemplate("confirm password cannot be empty")
                    .addPropertyNode("confirmPassword").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Confirm Passwords not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here
        if (user.getEmail().compareTo("") == 0) {
            context.buildConstraintViolationWithTemplate("Email cannot be empty")
                    .addPropertyNode("email").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }

        if (this.userService.isEmailExists(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email is exists")
                    .addPropertyNode("email").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }

        if (user.getFirstName().compareTo("") == 0) {
            context.buildConstraintViolationWithTemplate("firstName cannot be empty")
                    .addPropertyNode("firstName").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }

        if (user.getLastName().compareTo("") == 0) {
            context.buildConstraintViolationWithTemplate("lastName cannot be empty")
                    .addPropertyNode("lastName").addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }
}
