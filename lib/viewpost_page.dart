import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Comment {
  final String username;
  final String comment;
  final String timestamp;
  final bool isReply;
  final String replyTo;
  final String profilePictureUrl;
  int likes;

  Comment({
    required this.username,
    required this.comment,
    required this.timestamp,
    this.isReply = false,
    this.replyTo = '',
    this.likes = 0,
    this.profilePictureUrl = '',
  });
}

class ViewPostPage extends StatefulWidget {
  @override
  _ViewPostPageState createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  int _currentPage = 0;
  List<Comment> comments = [
    Comment(
      username: 'roses_are_rosie',
      comment: 'น่ากินมาก ต้องลองแล้ว!',
      timestamp: '2568-12-30',
      profilePictureUrl: 'assets/img/profile/rose.jpg',
      likes: 2000,
    ),
    Comment(
      username: 'yerimiese',
      comment: 'ที่สุดดดดดด',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: 'roses_are_rosie',
      likes: 2370,
      profilePictureUrl: 'assets/img/profile/Yeri.jpg',
    ),
    Comment(
      username: 'roses_are_rosie',
      comment: 'ลุยยยยย',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: 'roses_are_rosie',
      likes: 1122,
      profilePictureUrl: 'assets/img/profile/rose.jpg',
    ),
    Comment(
      username: 'lalalalisa_m',
      comment: 'อยากไปกินเจ้าคิตตี้~',
      timestamp: '2568-12-30',
      profilePictureUrl: 'assets/img/profile/lisa.jpg',
      likes: 9100,
    ),
    Comment(
      username: 'yerimiese',
      comment: 'น้องน่ารักมากก ><',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: 'lalalalisa_m',
      likes: 3305,
      profilePictureUrl: 'assets/img/profile/Yeri.jpg',
    ),
    Comment(
      username: '_imyour_joy',
      comment: 'นี้ ฉันอยากกินฮันนี่โทสต์ ซื้อมาฝากหน่อยย~',
      timestamp: '2568-12-30',
      profilePictureUrl: 'C:\Project-Mobile-App\assets\img\profile\Joy.jpg',
      likes: 2106,
    ),
    Comment(
      username: 'yerimiese',
      comment: 'เอาเงินมาสิ เดี๋ยวของไปเลย',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: '_imyour_joy',
      likes: 8900,
      profilePictureUrl: 'assets/img/profile/Yeri.jpg',
    ),
    Comment(
      username: '_imyour_joy',
      comment: 'พร้อมลุย เจ้าคิตตี้ของฉันน',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: 'yerimiese',
      likes: 4300,
      profilePictureUrl: 'assets/img/profile/Joy.jpg',
    ),
    Comment(
      username: 'm_kayoung',
      comment: 'ฝากซื้อด้วยคนได้ม้ายยย~~',
      timestamp: '2568-12-30',
      isReply: true,
      replyTo: 'yerimiese',
      likes: 5600,
      profilePictureUrl: 'assets/img/profile/kayoung.jpg',
    ),
   
  ];

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
              onPressed: () => context.go('/firstpage'),
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/img/profile/Yeri.jpg'),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "yerimiese",
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                                    _buildImage('assets/img/foods/food3.jpg'),
                                    _buildImage('assets/img/foods/food4.jpg'),
                                    _buildImage('assets/img/foods/food2.jpg'),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
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
                            "3 Street food ของงานเทศกาล sanrio  ที่ต้องลอง!",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "สวัสดีค่ะทุกคนน วันนี้เราจะมาบอกพิกัด street food ของงานเทศกาล sanrio ที่ต้องลองเมื่อถึงประเทศเกาหลีใต้กันค่ะ เราเลือกมา 3 อย่างด้วยกัน อยากรู้ว่ามีอะไรบ้าง ต้องลองไปดูกันเล้ยยย\n",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "1.Pudding pompompuri เป็นพุดดิ้งรูปน้อง pompompuri ที่ทำมาจากไข่แล้วมีแครกเกอร์อยู่ใต้พุดดิ้ง จะมีความเค็มๆ เนยและมีความหวานจากตัวพุดดิ้งของหวานอันนี้เป็นที่ฮิตมากๆ เมื่อถึงฤดูหนาวจะหาทานได้ง่ายกว่าฤดูอื่น รสชาติ : มีความหวานจากตัวพุดดิ้งเนื้อนุ่มเด้งดึ๋ง ตัดกับแคกเกอร์ที่มีความเค็มจากเนย เป็นของหวานที่กินแล้วต้องซื้อมาซ้ำอีกกก เพราะมีรูปน้องปอมปอมที่น่ารักมากกกกก T^T ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "ราคา 1500-2000 ₩ \nพิกัด หน้าสถานีฮงอิค ทางออก 6 ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "2. บิงซูซินนามอน\n ต่อมาจะเป็นบิงซูรูปน้องซินนามอนความเกล็ดน้ำแข็งรสนมฮอกไกโดละมุนลิ้นมากก มีท็อปปิ้งให้เลือกเยอะมากที่สั่งมาจะเป็นราดนมข้นและชาเขียวนม และยังมีของกินที่สั่งมากเพิ่มเติมอีกคือ บิงซูชาเขียวที่ออนท็อปตุ๊กตาน่ารักกกแถมยังมีโอติมรสข้าวเหนียวมะม่วงบ้านเราอีกด้วย! ที่ออนท็อปด้วยน้องปอมปอมปูริ \nรสชาติ : มีความหวานจากนํ้าเกล็ดแข็งนมสดรสฮอกไกโด และเพิ่มความหวานด้วย  การราดนมข้นและชาเขียวนมลงไป ฟินสุดๆ ต้องลองค่ะ! \nราคา 1900-3000 ₩  \nพิกัด หน้าสถานีองอิค กางออก 6 ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "3. ฮันนี่โทสต์ เฮลโลคิตตี้! \nของหวานที่เราทานบ่อยมากในหน้าหนาวช่วงนี้ 55555 ฮันนี่โทสต์ น้องคิตตี้ ขนมปังที่ออนท็อปวิปครีมรูปน้องคิตตี้ และมีเม็ดทับทิมกรอบ แถมยังราดน้ำผึ้งเพื่อเพิ่มความหวานอีกด้วยยย และมีก็อปปิ้งให้เลือกเยอะมาก แต่ที่เราเลือกมาจะมี แครกเกอร์และชาเขียวแก่งขนมหวานค่ะ  รสชาติ : หอมขนมปังมากกก ร้อนๆ จากเตา มีความหวานจากนํ้าผึ้งที่ราดและนมจากวิปครีมรูปคิตตี้ที่น่ารักสุดๆ ของโปรดที่ 1 ในใจเลยค่ะตอนนี้ ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "ราคา 3500-5000 ₩ \nพิกัด ร้าน Puppy House ตรงข้ามตลาดมังวอน",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "#Mahidol",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.green),
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
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "9 comments",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              // Comments
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: comments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      comments[index].isReply ? 60.0 : 15.0,
                                      8.0,
                                      15.0,
                                      8.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  comments[index]
                                                      .profilePictureUrl),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      comments[index].username,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      comments[index].comment,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 4.0),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          comments[index]
                                                              .timestamp,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        SizedBox(width: 8.0),
                                                        Text(
                                                          "Reply",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        // Handle like button pressed
                                                      },
                                                      icon: Icon(Icons
                                                          .favorite_border),
                                                    ),
                                                    Text(
                                                      comments[index]
                                                          .likes
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12.0),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
            // Footer
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    // Comment input field
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFD6D6D6), // กำหนดพื้นหลังเป็นสีเทาอ่อน
                        borderRadius:
                            BorderRadius.circular(15.0), // กำหนดความโค้งของกรอบ
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize
                                .min, // กำหนดให้ Row มีขนาดเท่าที่จำเป็น
                            children: [
                              // Emojis
                              IconButton(
                                onPressed: () {
                                  // Handle emoji button pressed
                                },
                                icon: Icon(Icons.star_outlined,
                                    size: 24.0, color: Colors.yellow),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle emoji button pressed
                                },
                                icon: Icon(Icons.favorite_outlined,
                                    size: 24.0, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle emoji button pressed
                                },
                                icon: Icon(Icons.question_mark_outlined,
                                    size: 24.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Bookmarks Icon and Count
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Handle bookmark button pressed
                              },
                              icon: Icon(Icons.bookmark_outline),
                            ),
                            Text(
                              "123 saved", // Replace with actual bookmark count
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Like Icon and Count
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Handle like button pressed
                                    },
                                    icon: Icon(Icons.favorite_outline),
                                  ),
                                  Text(
                                    "38,803", // Replace with actual like count
                                  ),
                                ],
                              ),
                              // Comments Icon and Count
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Scroll to comments section or focus on comment input
                                    },
                                    icon: Icon(Icons.chat_bubble_outline),
                                  ),
                                  Text(
                                    "9", // Replace with actual comment count
                                  ),
                                ],
                              ),
                              // Share Icon
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Scroll to comments section or focus on comment input
                                    },
                                    icon: Icon(Icons.send_outlined),
                                  ),
                                ],
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
