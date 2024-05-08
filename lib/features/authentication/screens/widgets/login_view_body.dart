import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/authentication/manager/login_notifier.dart';
import 'package:shopping_app/features/home/screens/bottom_nav_bar.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';
import 'package:shopping_app/utils/snack_bar.dart';
import 'package:shopping_app/utils/validators/validation.dart';
import '../signup_view.dart';
import 'package:shopping_app/common/widgets/custom_button.dart';
import 'package:shopping_app/common/widgets/custom_pass_textField.dart';
import 'custom_spacer.dart';
import 'package:shopping_app/common/widgets/custom_textfield.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LoginData>(
        builder: (context, loginData, _) => Form(
          key: loginData.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Image.asset(
                    "assets/images/auth/Tech Life Communication.png",
                    width: 240,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  LogIn",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        fontFamily: AppColors.kFontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                    onChanged: (value) {
                      loginData.setEmail(value);
                      print(value);
                    },
                    validator: (value) => Validation.validateEmailLogin(
                      value,
                      "Email",
                      loginData.showEmailNotExist,
                    ),
                    icon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    onChanged: (value) {
                      loginData.setPassword(value);
                      print(value);
                    },
                    validator: (value) =>
                        Validation.validateRequired(value, "Password"),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget password?   ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                        fontFamily: AppColors.kFontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  CustomButton(
                    buttonName: "Login",
                    onPressed: () async {
                      if (loginData.email != null) {
                        bool isExist = await DatabaseService.doesEmailExist(
                            loginData.email!);
                        print("Email is exist = $isExist");
                        loginData.setShowEmailNotExist(!isExist);
                      }
                      if (loginData.formKey.currentState != null &&
                          loginData.formKey.currentState!.validate()) {
                        print(loginData.email);
                        print(loginData.password);
                        bool isEmailAndPasswordMatch =
                            await DatabaseService.doEmailAndPasswordMatch(
                                loginData.email!, loginData.password!);
                        print(isEmailAndPasswordMatch);
                        if (isEmailAndPasswordMatch) {
                          SnakBar.showSnakBar(
                            context,
                            "Login successfully",
                            Colors.green,
                            Icons.check_circle,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBar(),
                            ),
                          );
                        } else {
                          SnakBar.showSnakBar(
                            context,
                            "Email and password don't match",
                            Colors.red,
                            Icons.error,
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  const CustomSpacer(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don\'t have an account?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppColors.kFontFamily,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        },
                        child: const Text(
                          " Sign Up",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                            fontFamily: AppColors.kFontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
