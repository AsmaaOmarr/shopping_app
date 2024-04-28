import 'package:flutter/material.dart';
import 'package:shopping_app/features/authentication/screens/login/login_view.dart';
import 'package:shopping_app/features/authentication/models/user.dart';
import 'package:shopping_app/common/widgets/custom_button.dart';
import 'package:shopping_app/common/widgets/custom_pass_textField.dart';
import 'package:shopping_app/features/authentication/screens/login/widgets/custom_spacer.dart';
import 'package:shopping_app/features/personalization/screens/profile_view.dart';


import 'package:shopping_app/units/snak_bar.dart';
import 'package:shopping_app/units/local_storage/shared_prefs.dart';
import 'package:shopping_app/units/validators/validation.dart';

import 'package:shopping_app/units/constants/colors.dart';

import 'package:shopping_app/common/widgets/custom_textfield.dart';


class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? fullName, email, password, studentID, gender, cPassword;
  String? level = "Select Level";
  bool showEmailExist = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset("assets/images/auth/Tech Life Remote Life.png"),
              const SizedBox(height: 10),
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
                  fullName = value;
                  print(fullName);
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
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateEmailSignUp(
                  value,
                  "Email",
                  showEmailExist,
                ),
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Password',
                hint: 'Enter your password',
                onChanged: (value) {
                  password = value;
                  print(password);
                },
                validator: (value) =>
                    Validation.validatePassword(value, "Password"),
              ),
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Confirm password',
                hint: 'Rewrite your password',
                onChanged: (value) {
                  cPassword = value;
                  print(cPassword);
                },
                validator: (value) => Validation.validateConfirmPassword(
                    value, password, "Confirm Password"),
              ),
              const SizedBox(height: 16),
    
              CustomButton(
                buttonName: "Sign Up",
                onPressed: () async {
                  bool isExist = false;
                  if (email != null) {
                    isExist =
                        await SharedPreferencesService.doesEmailExist(email!);
                    print("Email is exist = $isExist");
                    setState(() {
                      isExist ? showEmailExist = true : showEmailExist = false;
                    });
                  }
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate() &&
                      !isExist) {
                    User user = User(
                      name: fullName!,
                      email: email!,
                      studentId: studentID!,
                      password: password!,
                      gender: gender,
                      level: level,
                    );
                    print(user);
                    await SharedPreferencesService.addUser(user);
                    //await SharedPreferencesService.removeUser(email!);
                    List<User> users =
                        await SharedPreferencesService.getAllUsers();
                    print(users);
                    SnakBar.showSnakBar(
                      context,
                      "Sing up success",
                      Colors.green,
                      Icons.check_circle,
                    );
                    // List<User> userss =
                    //     await SharedPreferencesService.getAllUsers();
                    // print(userss);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileView(email: email!),
                      ),
                    );
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
        )),
      ),
    );
  }
}
