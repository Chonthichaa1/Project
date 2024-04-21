import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'footer_page.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = index == _selectedIndex;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected
                ? Color.fromARGB(255, 224, 242, 255)
                : Colors.grey[200],
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Color.fromARGB(255, 58, 156, 255)
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/firstpage');
          },
        ),
        title: Text('Notifications'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            color: Color.fromARGB(255, 110, 189, 249),
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: [
            _buildTab('All', 0),
            _buildTab('Tag & mentions', 1),
            _buildTab('Likes', 2),
            _buildTab('Follows', 3),
            _buildTab('Comment', 4),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          _buildListView('All notifications'),
          _buildListView('Tag & mentions notifications'),
          _buildListView('Likes notifications'),
          _buildListView('Follows notifications'),
          _buildListView('Comment notifications'),
        ],
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: 2,
        onItemTapped: (index) {},
      ),
    );
  }

  Center _buildListView(String text) {
    return Center(
      child: ListView.builder(
        itemCount: 1, // notification items
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  // User profile image
                  backgroundImage: AssetImage('assets/rose.jpg'),
                ),
                title: Text('roses_are_rosie'),
                subtitle: Text('Like your post. 10:08 PM'),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                  ),
                  child: Image.asset(
                    'assets/img/foods/Alienmochi.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  // User profile image
                  backgroundImage: AssetImage('assets/lisa.jpg'),
                ),
                title: Text('lalalalisa_m'),
                subtitle: Text('Started following you. 10:04 PM'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 110, 189, 249),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  // User profile image
                  backgroundImage: AssetImage('assets/rose.jpg'),
                ),
                title: Text('roses_are_rosie'),
                subtitle: Text('Commented on your post: look Yummy! 9:54 PM'),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                  ),
                  child: Image.asset(
                    'assets/img/foods/Alienmochi.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  // User profile image
                  backgroundImage: AssetImage('assets/jisoo.jpg'),
                ),
                title: Text('sooyaa__'),
                subtitle: Text('Started following you. 8:02 PM'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 110, 189, 249),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  // User profile image
                  backgroundImage: AssetImage('assets/jisoo.jpg'),
                ),
                title: Text('sooyaa__'),
                subtitle: Text('Like your post. 8:00 PM'),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                  ),
                  child: Image.asset(
                    'assets/img/foods/Alienmochi.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

