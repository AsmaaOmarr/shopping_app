import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/authentication/screens/login_view.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/features/home/models/stores_db.dart';
import 'package:shopping_app/features/on_boarding/screens/onboarding.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<StoreModel>? storedStores = await DatabaseService.getAllStores();
  if (storedStores.isEmpty) {
    await DatabaseService.saveStores(StoresDB.stores);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(0.9)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      home: const LoginView(),
    );
  }
}
