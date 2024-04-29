import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/store_list_provider.dart';
import 'package:shopping_app/utils/constants/colors.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontFamily: AppColors.kFontFamily),
        ),
      ),
      body: ChangeNotifierProvider(
          create: (context) => StoreListProvider(),
          child: const HomeViewBody()),
    );
  }
}
