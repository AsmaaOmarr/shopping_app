import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnakBar {
  static void showSnakBar(
      BuildContext context, String message, Color color, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 60,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: CupertinoColors.white,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                message,
                style: const TextStyle(
                  //fontFamily: Constant.kFontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  
}
