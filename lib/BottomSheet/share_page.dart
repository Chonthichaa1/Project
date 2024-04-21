import 'package:flutter/material.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Share to',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color.fromARGB(255, 132, 132, 132),
            width: double.infinity,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/img/iconapp/line.png'),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Line',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/img/iconapp/messenger.jpg'),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Messenger',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/img/iconapp/Instagram.png'),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Instagram',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/img/iconapp/copylink.jpg'),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Copy Link',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.download,
                  size: 30.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Download Photo',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 1,
                color: Color.fromARGB(255, 132, 132, 132),
                width: double.infinity,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.heart_broken,
                  size: 30.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Not Interested',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 1,
                color: Color.fromARGB(255, 132, 132, 132),
                width: double.infinity,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.report, color: Colors.red,
                  size: 30.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Report',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
