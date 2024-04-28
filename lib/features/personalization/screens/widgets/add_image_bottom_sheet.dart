import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/units/constants/colors.dart';


class AddImageBottomSheet extends StatefulWidget {
  final Function(Uint8List) onImageSelected;

  const AddImageBottomSheet({super.key, required this.onImageSelected});

  @override
  State<AddImageBottomSheet> createState() => _AddImageBottomSheetState();
}

class _AddImageBottomSheetState extends State<AddImageBottomSheet> {
  void takePhoto() async {
    Uint8List? image = await pickImage(ImageSource.camera);
    if (image != null) {
      widget.onImageSelected(image);
      Navigator.pop(context); // Close the bottom sheet
    }
  }

  void uploadImageFromGallery() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      widget.onImageSelected(img);
      Navigator.pop(context); // Close the bottom sheet
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      print("no image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add profile Image",
            style: TextStyle(
              fontSize: 18,
              fontFamily: AppColors.kFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCircleIcon(
                text: "Take a Photo",
                icon: Icons.camera_alt_rounded,
                onTap: () {
                  takePhoto();
                },
                backgroundColor: Colors.blue.shade100,
                iconColor: Colors.blue.shade700,
              ),
              CustomCircleIcon(
                text: "Upload From Gallery",
                icon: Icons.photo_library_outlined,
                onTap: () {
                  uploadImageFromGallery();
                },
                backgroundColor: const Color.fromARGB(255, 193, 245, 195),
                iconColor: const Color.fromARGB(255, 67, 177, 73),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CustomCircleIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color backgroundColor;
  final Color iconColor;
  const CustomCircleIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              size: 26,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: AppColors.kFontFamily,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
