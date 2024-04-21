import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'footer_page.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;

  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: appBarHeight,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => context.go('/profile'),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _pronounsController;
  late TextEditingController _ageController;
  late TextEditingController _regionController;
  late Uint8List? _selectedImage = null;


  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _pronounsController = TextEditingController();
    _ageController = TextEditingController();
    _regionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: _selectedImage != null
                    ? Image.memory(_selectedImage!).image
                    : AssetImage('assets/jennie.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: _pickImage,
              child: Text(
                'Edit Photo',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 8),
            buildProfileItem('Username', _usernameController),
            buildProfileItem('Bio', _bioController),
            buildProfileItem('Pronouns', _pronounsController),
            buildProfileItem('Age', _ageController),
            buildProfileItem('Region', _regionController),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save data here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(95, 40),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logout here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(95, 40),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: 4,
        onItemTapped: (index) {},
      ),
    );
  }

  Widget buildProfileItem(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
                bottom: title == 'Region'
                    ? BorderSide(color: Colors.grey, width: 0.5)
                    : BorderSide.none,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: controller,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit $title'),
                          content: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Enter new $title',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _selectedImage = imageBytes;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    _pronounsController.dispose();
    _ageController.dispose();
    _regionController.dispose();
    super.dispose();
  }
}
