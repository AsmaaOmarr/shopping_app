import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/Favorite_stores/manager/fav_list_provider.dart';
import 'package:shopping_app/features/Favorite_stores/screens/widgets/fav_view_body.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class FavoriteView extends StatelessWidget {
  final String userEmail;
  const FavoriteView({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Stores',
          style: TextStyle(fontFamily: AppColors.kFontFamily),
        ),
        leading: const Icon(
          CupertinoIcons.heart,
          color: AppColors.primary,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => FavoriteStoreListProvider(userEmail: userEmail),
        child: const FavoriteViewBody(),
      ),
    );
  }
}
