import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/Favorite_stores/manager/distance_provider.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class DistanceViewBody extends StatelessWidget {
  final StoreModel store;

  const DistanceViewBody({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.borderPrimary),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(store.imageUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Icon(
                      store.isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      size: 36,
                      color: store.isFavorite
                          ? Colors.red
                          : Colors.grey.shade800.withOpacity(0.6),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Branch",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppColors.kFontFamily,
                ),
              ),
              Text(
                store.address,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: AppColors.kFontFamily,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Distance from you to store",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppColors.kFontFamily,
                ),
              ),
              Consumer<DistanceProvider>(
                builder: (context, distanceProvider, _) {
                  if (distanceProvider.distance == null) {
                    return const Text(
                      "Calculating ...",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: AppColors.kFontFamily,
                      ),
                    );
                  } else {
                    return Text(
                      distanceProvider.distance!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: AppColors.kFontFamily,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
