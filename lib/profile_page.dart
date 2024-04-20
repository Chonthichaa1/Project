// import 'package:flutter/material.dart';
// import 'footer_page.dart';
// import "package:go_router/go_router.dart";

// class ProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profile_Pages',
//       theme: ThemeData(
//         primaryColor: Colors.grey,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   int _selectedIndex = 4;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '@jennierubyjane',
//               style: TextStyle(color: Colors.black),
//             )
//           ],
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 0,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(4.0),
//           child: Container(
//             color: Colors.grey,
//             height: 0.5,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/jennie.jpg'),
//                 ),
//                 ProfileInfo(
//                   label: 'Following',
//                   value: '3',
//                 ),
//                 ProfileInfo(
//                   label: 'Followers',
//                   value: '83.7k',
//                 ),
//                 ProfileInfo(
//                   label: 'Likes and saves',
//                   value: '10.4K',
//                 ),
//               ],
//             ),
//             SizedBox(height: 25),
//             Row(
//               children: [
//                 SizedBox(width: 10,),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Jennie\n',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20, 
//                         ),
//                       ),
//                       WidgetSpan(
//                         child: SizedBox(height: 30),
//                       ),
//                       TextSpan(
//                         text: 'Write a bio to help people discover you',
//                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 EditProfileButton(),
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: IconButton(
//                     onPressed: () {},
//                     iconSize: 20,
//                     icon: Icon(
//                       Icons.ios_share,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             ProfileActions(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: FooterPage(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

// class ProfileInfo extends StatelessWidget {
//   final String label;
//   final String value;

//   const ProfileInfo({
//     Key? key,
//     required this.label,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 20),
//           Text(
//             value,
//             style: TextStyle(fontSize: 20),
//           ),
//           Text(
//             label,
//             style: TextStyle(fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EditProfileButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 40,
//       child: ElevatedButton(
//         onPressed: () => context.go('/editprofile'),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//             side: BorderSide(color: Colors.grey),
//           ),
//         ),
//         child: Text(
//           'Edit Profile',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileActions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         IconButton(
//           icon: Icon(Icons.edit_outlined),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.bookmark_border),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.favorite_border),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:login/popup/share_page.dart';
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
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (context) => SharePage(),
      );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '@jennierubyjane',
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/jennie.jpg'),
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
                SizedBox(width: 10,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Jennie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20, 
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(height: 30),
                      ),
                      TextSpan(
                        text: 'Write a bio to help people discover you',
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
                    onPressed: () => _onItemTapped(_selectedIndex),
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
