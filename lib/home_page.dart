import 'package:flutter/material.dart';
import 'footer_page.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  final String? email;
  MyHomePage({this.email});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              GoRouter.of(context).go('/notification');
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
            SizedBox(width: 5),
            Text(
              'Salaya, Nakhon Pathom',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Near Me',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/MapScreen');
                  },
                  child: Container(
                    width: 350, 
                    height: 200, 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0),
                      child: Image.asset(
                        'assets/img/iconapp/map.png',
                        fit: BoxFit
                            .cover, 
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Popular Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  BuilPosthomepage(
                    imagePath: 'assets/jennie.jpg',
                    restaurantName: 'ร้านอาหาร1',
                    profileImageUrl: 'assets/jisoo.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/jisoo.jpg',
                    restaurantName: 'ร้านอาหาร2',
                    profileImageUrl: 'assets/jennie.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/lisa.jpg',
                    restaurantName: 'ร้านอาหาร3',
                    profileImageUrl: 'assets/rose.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/rose.jpg',
                    restaurantName: 'ร้านอาหาร4',
                    profileImageUrl: 'assets/lisa.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/jennie.jpg',
                    restaurantName: 'ร้านอาหาร5',
                    profileImageUrl: 'assets/jisoo.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/jisoo.jpg',
                    restaurantName: 'ร้านอาหาร6',
                    profileImageUrl: 'assets/jennie.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/lisa.jpg',
                    restaurantName: 'ร้านอาหาร7',
                    profileImageUrl: 'assets/rose.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                  BuilPosthomepage(
                    imagePath: 'assets/rose.jpg',
                    restaurantName: 'ร้านอาหาร8',
                    profileImageUrl: 'assets/lisa.jpg',
                    username: 'user123',
                    likes: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: 0,
        onItemTapped: (index) {
          print('Item $index tapped');
        },
      ),
    );
  }
}

Widget BuilPosthomepage({
  required String imagePath,
  required String restaurantName,
  required String profileImageUrl,
  required String username,
  required int likes,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Container(
      width: 180,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10), 
          Text(
            restaurantName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                      profileImageUrl,
                    ), 
                  ),
                  SizedBox(
                    width: 5,
                  ), // ระยะห่างระหว่างรูปโปรไฟล์กับ Username
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ), 
                  Text(
                    likes.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
