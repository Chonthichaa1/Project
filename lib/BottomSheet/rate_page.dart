import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:go_router/go_router.dart';

class RestaurantRatingBottomSheet extends StatefulWidget {
  const RestaurantRatingBottomSheet({Key? key}) : super(key: key);

  @override
  _RestaurantRatingBottomSheetState createState() =>
      _RestaurantRatingBottomSheetState();
}

class _RestaurantRatingBottomSheetState
    extends State<RestaurantRatingBottomSheet> {
  int _selectedStars = 0;
  List<File> imageFiles = [];

  void _onStarPressed(int starIndex) {
    setState(() {
      _selectedStars = starIndex + 1;
    });
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFiles.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Rate the restaurant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color.fromARGB(255, 132, 132, 132),
            width: double.infinity,
          ),
          SizedBox(height: 20),
          Text(
            'Give stars to the restaurant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: List.generate(
              5,
              (index) => IconButton(
                onPressed: () => _onStarPressed(index),
                icon: Icon(
                  index < _selectedStars ? Icons.star : Icons.star_border,
                  color: index < _selectedStars ? Colors.yellow : Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Comment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.chat_outlined,
                size: 24,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 400,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your comment here...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              maxLines: 5,
            ),
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Text(
                'Add a photo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.photo_camera_outlined,
                size: 20,
              ),
            ],
          ),
          ImageContainer(imageFiles: imageFiles, pickImage: _pickImage),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 300,
              child: ElevatedButton(
                onPressed: () => context.go('/reviewmap'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Color(0xFF092F51),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "POST",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatefulWidget {
  final List<File> imageFiles;
  final Function pickImage;

  ImageContainer({required this.imageFiles, required this.pickImage});

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            for (int i = 0; i < widget.imageFiles.length; i++)
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Image.file(
                  widget.imageFiles[i],
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
            GestureDetector(
              onTap: () {
                widget.pickImage(context);
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  Icons.add,
                  size: 25.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
