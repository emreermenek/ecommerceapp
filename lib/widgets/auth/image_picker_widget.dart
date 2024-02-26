import 'dart:io';

import 'package:ecommerce_app_en/widgets/products/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, this.pickedImage, required this.func});

  final XFile? pickedImage;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground),
                        borderRadius: BorderRadius.circular(25)),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(
                                File(pickedImage!.path),
                              )),
                          border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: MaterialButtonWidget(
            size: 20,
            padding: 5.5,
            color: Colors.lightBlue.shade300,
            borderRadius: 25,
            icon: Icons.edit,
            func: () {
              func();
            },
          ),
        )
      ],
    );
  }
}
