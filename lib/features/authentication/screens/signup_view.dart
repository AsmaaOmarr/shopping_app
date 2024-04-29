import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/authentication/manager/signup_notifier.dart';

import 'widgets/signup_viewbody.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ChangeNotifierProvider(
        create: (context) => SignUpData(),
        child: const SignUpViewBody(),
      ),
    );
  }
}