import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_image_bottom_sheet.dart';

// ignore: must_be_immutable
class ProfileImage extends StatefulWidget {
  final Function(Uint8List) onImageSelected;
  Uint8List? userImage;
  ProfileImage({
    super.key,
    required this.onImageSelected,
    required this.userImage,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: widget.userImage == null
                  ? const AssetImage("assets/images/img_temp.jpg")
                  : MemoryImage(widget.userImage!) as ImageProvider<Object>,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade200,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    showBottomSheet(
                        backgroundColor: CupertinoColors.white,
                        elevation: 5,
                        context: context,
                        builder: (BuildContext context) {
                          return AddImageBottomSheet(
                            onImageSelected: (selectedImage) {
                              print("image");
                              print(selectedImage);
                              setState(() {
                                widget.userImage = selectedImage;
                              });
                              widget.onImageSelected(selectedImage);
                            },
                          );
                        });
                  },
                  icon: const Icon(
                    CupertinoIcons.add,
                    size: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
