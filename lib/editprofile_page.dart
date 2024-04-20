import 'package:flutter/material.dart';
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
            CircleAvatar(
              backgroundImage: AssetImage('assets/jennie.jpg'),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(
              'Edit Photo',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 8), // ลดความสูงของ Container
            buildProfileItem('Username', _usernameController),
            buildProfileItem('Bio', _bioController),
            buildProfileItem('Pronouns', _pronounsController),
            buildProfileItem('Age', _ageController),
            buildProfileItem('Region', _regionController),
            SizedBox(height: 20), // ลดความสูงของ Container

            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // จัดวางปุ่มให้อยู่กึ่งกลางและมีระยะห่างเท่ากัน
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ทำบันทึกข้อมูลที่นี่
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // เปลี่ยนสีปุ่มเป็นสีเขียว
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // เพิ่มความโค้งให้กับปุ่ม
                    ),
                    fixedSize: Size(95, 40),
                  ),
                  child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ทำการ Logout ที่นี่
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // เปลี่ยนสีปุ่มเป็นสีแดง
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // เพิ่มความโค้งให้กับปุ่ม
                    ),
                    fixedSize: Size(95, 40),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white), // เปลี่ยนสีตัวอักษรเป็นสีขาว
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
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0, vertical: 0.0), // ลดความสูงของ Container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white, // เปลี่ยนสีพื้นหลังเป็นสีขาว
              border: Border(
                top: BorderSide(
                    color: Colors.grey, width: 0.5), // เพิ่มเส้นด้านบน
                bottom: title == 'Region'
                    ? BorderSide(color: Colors.grey, width: 0.5)
                    : BorderSide.none, // เพิ่มเส้นด้านล่าง หากเป็น Region
              ),
            ),
            width: MediaQuery.of(context)
                .size
                .width, // กำหนดความยาวของ Container เท่ากับความกว้างของหน้าจอ
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
