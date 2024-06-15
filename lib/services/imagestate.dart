import 'dart:io';

import 'package:flutter/material.dart';

class ImageProviders extends ChangeNotifier{
  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File? image) {
    _imageFile = image;
    notifyListeners(); // Notify listeners of the change
  }
}
