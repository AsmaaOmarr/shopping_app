import 'package:flutter/material.dart';

import 'widgets/profile_viewbody.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(email: email,),
    );
  }
}
