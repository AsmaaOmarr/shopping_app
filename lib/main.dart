import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/features/home/models/stores_db.dart';
import 'package:shopping_app/features/home/screens/bottom_nav_bar.dart';
import 'package:shopping_app/features/on_boarding/screens/onboarding.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/local_storage/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<StoreModel>? storedStores = await SharedPreferencesService.getAllStores();
  if (storedStores.isEmpty) {
    await SharedPreferencesService.saveStores(StoresDB.stores);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      home: const BottomNavBar(),
    );
  }
}
