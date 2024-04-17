import 'package:flutter/material.dart';
import 'footer_page.dart';
import "package:go_router/go_router.dart";

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
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '@่jennierubyjane',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/jennie.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      '3',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      '83.7k',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      '10.4K',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Likes',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  '     Write a bio to help people discover you',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // ใส่โค้ดเมื่อกดปุ่มแก้ไข
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => context.go('/editprofile'),
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
                ),
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // ใส่โค้ดเมื่อกดปุ่ม Share
                    },
                    iconSize: 20,
                    icon: Icon(
                      Icons.ios_share,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.edit_outlined),
                  onPressed: () {
                    // ใส่โค้ดเมื่อกดปุ่ม Edit
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    // ใส่โค้ดเมื่อกดปุ่ม Bookmark
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // ใส่โค้ดเมื่อกดปุ่ม Favorite
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
