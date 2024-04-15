import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notifications'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
           // slide
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Tag & mentions',
            ),
            Tab(
              text: 'Likes',
            ),
            Tab(
              text: 'Follows',
            ),
            Tab(
              text: 'Comment',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(
            child: Text('All notifications'),
          ),
          Center(
            child: Text('Tag & mentions notifications'),
          ),
          Center(
            child: Text('Likes notifications'),
          ),
          Center(
            child: Text('Follows notifications'),
          ),
          Center(
            child: Text('Comment notifications'),
          ),
        ],
      ),
    );
  }
}
