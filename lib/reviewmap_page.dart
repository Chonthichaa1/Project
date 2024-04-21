import 'package:flutter/material.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:intl/intl.dart';
import 'package:login/BottomSheet/rate_page.dart';
class reviewmap extends StatefulWidget {
  @override
  _reviewmapState createState() => _reviewmapState();
}

class _reviewmapState extends State<reviewmap> {
  String? selectedOption;

  final TextEditingController searchController = TextEditingController();

    void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => RestaurantRatingBottomSheet(), // แสดง BottomSheet จาก share_page.dart
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: RatingSummary(
                counter: 20,
                average: 4,
                counterFiveStars: 10,
                counterFourStars: 5,
                counterThreeStars: 4,
                counterTwoStars: 1,
                counterOneStars: 0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showBottomSheet(context); // เรียกใช้ BottomSheet เมื่อปุ่มถูกแตะ
                },
                child: Container(
                  width: 140,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.thumbs_up_down,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text('Write a review'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'Search for reviews',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: false,
                              ),
                              hint: Text('จัดเรียงรายการโดย'),
                              isExpanded: true,
                              value: selectedOption,
                              items: <String>[
                                'Option 1',
                                'Option 2',
                                'Option 3',
                                'Option 4'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // New Container for User Profile Info
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // User Profile Picture
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/jennie.jpg'), // Replace with actual image
                        ),
                        SizedBox(width: 10),
                        // Username
                        Column(
                          // เพิ่ม Column เพื่อแสดงข้อความ Username และจำนวนรูปภาพ
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '1 photos', // ปรับตามจำนวนรูปภาพที่มีอยู่ในโพสต์
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey, // สีของข้อความจำนวนรูปภาพ
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        // Post Count
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  // Star Rating and Post Time
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // Star Rating
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < 5
                                  ? Icons.star
                                  : Icons
                                      .star_border, // เลือกไอคอนดาวที่เต็มหรือว่าง
                              color: index < 4
                                  ? Colors.yellow
                                  : Colors.grey, // กำหนดสีของไอคอน
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        // Post Time
                        Text(
                          '${_formatDateTime(DateTime.now())}', // เรียกใช้ฟังก์ชั่น _formatDateTime และแสดงผลลัพธ์
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text Overflow Handling
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          'ร้านอาหารนี้เป็นหนึ่งในที่สุดที่ผมเคยไป บรรยากาศดีมาก อาหารอร่อยมาก และบริการดีเยี่ยม ไม่แปลกใจเลยที่ได้รับคะแนน 4 ดาว! ผมขอแนะนำให้ลองเยี่ยมชม',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // Image
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Image.asset(
                          'assets/jennie.jpg', // Replace with actual image
                          width: 150, // ปรับขนาดตามที่ต้องการ
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    String formattedTime = DateFormat('h:mm a dd/MM/yy').format(dateTime);
    return '$formattedTime';
  }
}
