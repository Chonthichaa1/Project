import 'package:flutter/material.dart';
import 'footer_page.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color searchBoxColor = const Color.fromARGB(255, 99, 99, 99);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 110, 189, 249),
            ),
            SizedBox(width: 8),
            Text(
              'Salaya, Nakhon Pathom',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 216, 216, 216),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Color.fromARGB(255, 233, 233, 233)),
                color: searchBoxColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Near me',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 164, 164, 164)),
                      ),
                      // Map section goes here
                    ),
                    SizedBox(height: 6),
                    ListTile(
                      title: Text(
                        'Popular Now',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 260,
                                height: 340,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                  ),
                                ),
                                // Popular Now - Column 1
                              ),
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'jennierubyjane', // นำชื่อผู้ใช้มาใส่ใน title
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '2.4M',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  'Stunning view! 😍', // เอาแคปชั่นมาใส่ใน subtitle
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/jennie.jpg'),
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 260,
                                      height: 340,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 164, 164, 164),
                                        ),
                                      ),
                                      // Popular Now - Column 2
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'yerimiese',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '1.2M',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/yeri.jpg'),
                                        radius: 12,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ],
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
          ),
        ],
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: 0, // Set initial selected index here
        onItemTapped: (index) {
          // Handle item tap here
          print('Item $index tapped');
        },
      ),
    );
  }
}
