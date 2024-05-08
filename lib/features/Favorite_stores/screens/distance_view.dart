import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/Favorite_stores/manager/distance_provider.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/constants/colors.dart';

import 'widgets/distance_view_body.dart';

class DistanceView extends StatelessWidget {
  final StoreModel store;
  const DistanceView({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          store.name,
          style: const TextStyle(fontFamily: AppColors.kFontFamily),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => DistanceProvider()..getDistance(store),
        child: DistanceViewBody(
          store: store,
        ),
      ),
    );
  }
}
