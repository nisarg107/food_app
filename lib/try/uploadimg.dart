import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvapp/models/imagestate.dart';
import 'package:mvapp/try/reastaurantpage.dart';
import 'package:provider/provider.dart';

class UploadImageWidget extends StatefulWidget {
  @override
  _UploadImageWidgetState createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  List<XFile> _images = [];
  final _imagePicker = ImagePicker();
  

  Future<void> _pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Provider.of<ImageProviders>(context, listen: false)
          .setImageFile(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviders>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RestaurantPage(restaurantName: "Honest",rating: 5,priceRange: 1200,cuisineType: "Italian",imageUrl: "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=600",features: ["Nice","Good"],),
            SizedBox(height: 10,),
            Column(
                  children: [
                    if (imageProvider.imageFile != null)
                      Image.file(imageProvider.imageFile!),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Upload Image'),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
