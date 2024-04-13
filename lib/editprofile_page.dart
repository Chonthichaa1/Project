import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5), // สีเทาจาง
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Spacer เพื่อช่วยให้หัวข้อแสดงตรงกลาง
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(width: 0), // ระยะห่างระหว่างหัวข้อและปุ่มย้อนกลับ
              ],
            ),
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
              backgroundImage: NetworkImage(
                'URL ของรูปผู้ใช้งาน',
              ),
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
    );
  }

Widget buildProfileItem(String title, String detail) {
  return Container(
    height: 55,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      border: Border(
        top: title == 'Name' ? BorderSide(color: Colors.grey) : BorderSide.none, // เพิ่มเงื่อนไขสำหรับการแสดงเส้นขอบด้านบน
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







