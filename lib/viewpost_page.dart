import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewPostPage extends StatefulWidget {
  @override
  _ViewPostPageState createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => context.go('/profile'),
              ),
              centerTitle: true,
              title: Text(
                "Food",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Column(children: [
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/jennie.jpg'),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0, // กำหนดความกว้างของ Container
              height: 350.0, // กำหนดความสูงของ Container
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: _pageChanged,
                          children: [
                            _buildImage('assets/Joy.jpg'),
                            _buildImage('assets/jennie.jpg'),
                            _buildImage('assets/Yeri.jpg'),
                            // เพิ่มรูปภาพอื่นๆ ตามต้องการ
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == _currentPage
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Post Title",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lorem nec turpis blandit interdum.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "#Mahidol",
                    style: TextStyle(fontSize: 15.0, color: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 120.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0), // ระยะห่างซ้าย 15.0
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.explore,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Thailand",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Last modified: 2568-12-31",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 160.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0), // ระยะห่างซ้าย 15.0
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "FoodThailand",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green,
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              )
            ])
          ])),
    );
  }

  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  void _pageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
