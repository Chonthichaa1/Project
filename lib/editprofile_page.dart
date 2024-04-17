import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'footer_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;

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
              Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
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
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // ใช้ CustomAppBar แทน Appbar ทั่วไป
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              backgroundImage: AssetImage('assets/jisoo.jpg'),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(
              'Upload Profile',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            buildProfileItem('Name', 'John Doe'),
            buildProfileItem('Username', 'johndoe123'),
            buildProfileItem('Bio', 'My name is John Doe.'),
            buildProfileItem('Pronouns', 'He/Him'),
            buildProfileItem('Age', '25'),
            buildProfileItem('Region', 'New York, USA'),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildProfileItem(String title, String detail) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          top: title == 'Name'
              ? BorderSide(color: Colors.grey)
              : BorderSide.none, // เพิ่มเงื่อนไขสำหรับการแสดงเส้นขอบด้านบน
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 8,
            child: Text(
              detail,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
