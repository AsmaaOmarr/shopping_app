import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/authentication/manager/signup_notifier.dart';
import 'package:shopping_app/features/authentication/screens/login_view.dart';
import 'package:shopping_app/features/authentication/models/user.dart';
import 'package:shopping_app/common/widgets/custom_button.dart';
import 'package:shopping_app/common/widgets/custom_pass_textField.dart';
import 'package:shopping_app/features/authentication/screens/widgets/custom_spacer.dart';
import 'package:shopping_app/features/home/screens/bottom_nav_bar.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';
import 'package:shopping_app/utils/snack_bar.dart';
import 'package:shopping_app/utils/validators/validation.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/common/widgets/custom_textfield.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SignUpData>(
        builder: (context, signUpData, _) => Form(
          key: signUpData.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/images/auth/Tech Life Remote Life.png",
                    width: 240,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  SignUp",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        fontFamily: AppColors.kFontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Full name',
                    hint: 'Enter your full name',
                    onChanged: (value) {
                      signUpData.setFullName(value);
                      print(value);
                    },
                    validator: (value) => Validation.validateRequired(
                      value,
                      "Name",
                    ),
                    icon: Icons.person_2_rounded,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    label: 'Email',
                    hint: 'example@email.com',
                    onChanged: (value) {
                      signUpData.setEmail(value);
                      print(value);
                    },
                    validator: (value) => Validation.validateEmailSignUp(
                      value,
                      "Email",
                      signUpData.showEmailExist,
                    ),
                    icon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    onChanged: (value) {
                      signUpData.setPassword(value);
                      print(value);
                    },
                    validator: (value) =>
                        Validation.validatePassword(value, "Password"),
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    label: 'Confirm password',
                    hint: 'Rewrite your password',
                    onChanged: (value) {
                      signUpData.setCPassword(value);
                      print(value);
                    },
                    validator: (value) => Validation.validateConfirmPassword(
                        value, signUpData.password, "Confirm Password"),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    buttonName: "Sign Up",
                    onPressed: () async {
                      bool isExist = false;
                      if (signUpData.email != null) {
                        isExist = await DatabaseService.doesEmailExist(
                            signUpData.email!);
                        print("Email is exist = $isExist");
                        signUpData.setShowEmailExist(isExist);
                      }
                      if (signUpData.formKey.currentState != null &&
                          signUpData.formKey.currentState!.validate() &&
                          !isExist) {
                        User user = User(
                          name: signUpData.fullName!,
                          email: signUpData.email!,
                          password: signUpData.password!,
                        );
                        print(user);
                        await DatabaseService.addUser(user);
                        SnakBar.showSnakBar(
                          context,
                          "Sing up success",
                          Colors.green,
                          Icons.check_circle,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(
                              userEmail: signUpData.email!,
                            ),
                          ),
                        );
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProfileView(email: signUpData.email!),
                        //   ),
                        // );
                      } else {
                        SnakBar.showSnakBar(
                          context,
                          "Sign up failure",
                          Colors.red,
                          Icons.error,
                        );
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
                        "Joined us before?",
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
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: const Text(
                          " Log In",
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
