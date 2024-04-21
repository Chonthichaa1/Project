import 'package:flutter/material.dart';
import 'reviewmap_page.dart';
import 'footer_page.dart';
import 'package:go_router/go_router.dart';
import 'package:login/BottomSheet/share_page.dart';

void main() {
  runApp(const TabBarinfo());
}

class TabBarinfo extends StatelessWidget {
  const TabBarinfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _TabBarinfoState(),
    );
  }
}

class _TabBarinfoState extends StatefulWidget {
  const _TabBarinfoState({Key? key});

  @override
  State<_TabBarinfoState> createState() => _TabBarinfoStateState();
}

class _TabBarinfoStateState extends State<_TabBarinfoState>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SharePage(), // แสดง BottomSheet จาก share_page.dart
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).go('/profile');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.ios_share), // แก้ไขไอคอนเป็น ios_share
              onPressed: () {
                _showBottomSheet(context); // เรียกใช้ BottomSheet เมื่อไอคอน ios_share ถูกแตะ
              },
            ),
            Icon(Icons.more_horiz),
          ],
          bottom: TabBar(
            indicatorColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        _tabController.index == 0 ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        _tabController.index == 1 ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          title: const Text('Restaurant_About'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Center(
                    child: Container(
                      width: 400, // กำหนดความกว้างของ Container
                      height: 150, // กำหนดความสูงของ Container
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 139, 139, 139),
                          width: 0.5,
                        ), // กำหนดสีและขนาดของเส้นกรอบ
                        borderRadius: BorderRadius.circular(15),
                        // กำหนดรูปร่างของ Container
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/img/foods/food.jpg'), // รูปภาพที่ต้องการใส่ใน Container
                          fit: BoxFit.cover, // ปรับขนาดรูปภาพให้เต็ม Container
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 400, // กำหนดความกว้างของ Container
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // จัดวางข้อความไปที่ด้านบน
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 60,
                                      color: Colors.blue,
                                    ), // ไอคอน location_on
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ถนน พุทธมณฑลสาย 4 ตำบล ศาลายา อำเภอ พุทธมณฑล จังหวัด นครปฐม 73170',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            // กำหนดระยะห่างด้านบนของเส้นกรอบ
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Located in: Mahidol University Salaya',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: 400, // กำหนดความกว้างของ Container
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // จัดวางข้อความไปที่ด้านบน
                                  children: [
                                    Icon(
                                      Icons
                                          .schedule, // เปลี่ยนไอคอนเป็น schedule
                                      size: 60,
                                      color: Colors.blue,
                                    ), // ไอคอน schedule
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Open | Closes 20:00',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            // กำหนดระยะห่างด้านบนของเส้นกรอบ
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Updated by others 2 weeks ago',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            reviewmap(), // Add this line to show profile page
          ],
        ),
        bottomNavigationBar: FooterPage(
          selectedIndex:
              3, // กำหนด selectedIndex เป็น -1 เพื่อไม่ให้มีการเลือกไอคอนเลย
          onItemTapped: (index) {}, // ไม่ต้องทำอะไรเมื่อมีการเลือกไอคอน
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
