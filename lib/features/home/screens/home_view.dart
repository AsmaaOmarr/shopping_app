import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/store_list_provider.dart';
import 'package:shopping_app/utils/constants/colors.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  final String userEmail;
  const HomeView({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stores',
          style: TextStyle(fontFamily: AppColors.kFontFamily),
        ),
        leading: const Icon(
          CupertinoIcons.bag,
          color: AppColors.primary,
        ),
      ),
      body: ChangeNotifierProvider(
          create: (context) => StoreListProvider(userEmail: userEmail),
          child: const HomeViewBody()),
    );
  }
}
