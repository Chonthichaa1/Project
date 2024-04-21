import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'footer_page.dart';
import 'login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfilePage extends StatefulWidget {
  final String email = UserData().emailf;
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _pronounsController;
  late TextEditingController _ageController;
  late TextEditingController _regionController;
  late File? _selectedImage;
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _pronounsController = TextEditingController();
    _ageController = TextEditingController();
    _regionController = TextEditingController();
    _fetchUserData();
    _selectedImage = null; 
  }

  void _fetchUserData() async {
    try {
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: widget.email)
          .limit(1)
          .get();
      if (userData.docs.isNotEmpty) {
        Map<String, dynamic> user =
            userData.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _usernameController.text = user['username'] ?? '';
          _bioController.text = user['bio'] ?? '';
          _pronounsController.text = user['pronouns'] ?? '';
          _ageController.text = user['age'] ?? '';
          _regionController.text = user['region'] ?? '';
          print('User data found');
          String? profileImagePath = user['profileImage'];
          if (profileImagePath != null) {
            _selectedImage = File(profileImagePath);
          }
        });
      } else {
        print('User data not found');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => context.go('/profile'),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : AssetImage('assets/jennie.jpg') as ImageProvider,
                child: _selectedImage == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 30,
                      )
                    : null,
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
            buildProfileItem(
                'Username', _usernameController, 'Enter username...'),
            buildProfileItem('Bio', _bioController, 'Enter bio...'),
            buildProfileItem(
                'Pronouns', _pronounsController, 'Enter pronouns...'),
            buildProfileItem('Age', _ageController, 'Enter age...'),
            buildProfileItem('Region', _regionController, 'Enter region...'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _fetchUserData();
                    _updateUserData();
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
                    GoRouter.of(context).go('/');
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

  Widget buildProfileItem(
      String title, TextEditingController controller, String hintText) {
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
                    // readOnly: true, // Remove this line
                    decoration: InputDecoration(
                      hintText: hintText,
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
                                // Save the data here
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
      setState(() {
        _selectedImage = File(pickedImage.path);
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

  void _updateUserData() async {
    print('Updating user data...');
    try {
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: widget.email)
          .limit(1)
          .get();
      if (userData.docs.isNotEmpty) {
        String userId = userData.docs.first.id;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'username': _usernameController.text,
          'bio': _bioController.text,
          'pronouns': _pronounsController.text,
          'age': _ageController.text,
          'region': _regionController.text,
          'profileImage': _selectedImage != null ? _selectedImage!.path : null,
        });
        print('User data updated successfully');
      } else {
        print('User data not found in Firestore');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
}
