import 'dart:io';
import 'package:flutter/material.dart';
import 'footer_page.dart';
import 'login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/BottomSheet/share_page.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile_Pages',
      theme: ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final String email = UserData().emailf;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _bioController = TextEditingController();

  late File _selectedImage = File('assets/img/profile/jennie.jpg');

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _fetchUserData();
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
  
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SharePage(), // แสดง BottomSheet จาก share_page.dart
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).go('/firstpage');
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "@${_usernameController.text}",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _selectedImage == null
                      ? null
                      : null, 
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage:
                        _selectedImage?.path != null 
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
                ProfileInfo(
                  label: 'Following',
                  value: '3',
                ),
                ProfileInfo(
                  label: 'Followers',
                  value: '83.7k',
                ),
                ProfileInfo(
                  label: 'Likes and saves',
                  value: '10.4K',
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${_usernameController.text}\n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(height: 30),
                      ),
                      TextSpan(
                        text: _bioController.text,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EditProfileButton(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {_showBottomSheet(context);},
                    iconSize: 20,
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ProfileActions(),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 0,
              runSpacing: 0,
              children: [
                buildContainer(130, 130, 'assets/img/foods/Kittydonut.jpg'),
                buildContainer(130, 130, 'assets/img/foods/coffee.jpg'),
                buildContainer(130, 130, 'assets/img/foods/salapao.jpg'),
                buildContainer(130, 130, 'assets/img/foods/dangngo.jpg'),
                buildContainer(130, 130, 'assets/img/foods/roll.jpg'),
                buildContainer(130, 130, 'assets/img/foods/thanghoolu.jpg'),
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
}

Widget buildContainer(double width, double height, String imagePath) {
  return Container(
    width: width,
    height: height,
    child: ClipRRect(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      child: ElevatedButton(
        onPressed: () {GoRouter.of(context).go('/editprofile');},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey),
          ),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfileActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.edit_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}
