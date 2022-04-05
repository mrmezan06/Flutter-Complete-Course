import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
    UserImagePicker({Key? key, required this.imagePickFn})
      : super(key: key);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  var _image;
  var imagePicker;
  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  void _pickImage() async {
    XFile image = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth:150.0,
        preferredCameraDevice: CameraDevice.front,
        );
    setState(() {
      _image = File(image.path);
    });
    widget.imagePickFn(File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image) : null,
        ),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: Icon(
            Icons.image,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            'Add Image',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0.0),
        ),
      ],
    );
  }
}
