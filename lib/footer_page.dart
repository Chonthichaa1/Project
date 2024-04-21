import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class FooterPage extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const FooterPage({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: selectedIndex == 0 ? Colors.blue : Colors.black),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,
              color: selectedIndex == 1 ? Colors.blue : Colors.black),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle, color: selectedIndex == 2 ? Color.fromARGB(255, 99, 185, 255) : Color.fromARGB(255, 99, 185, 255),size: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map,
              color: selectedIndex == 3 ? Colors.blue : Colors.black),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sensor_occupied,
              color: selectedIndex == 4 ? Colors.blue : Colors.black),
          label: '',
        ),
      ],

      currentIndex: selectedIndex < 0
          ? 0
          : selectedIndex, // ตรวจสอบค่า currentIndex ก่อนการใช้งาน
      onTap: (index) {
        switch (index) {
          case 0:
            GoRouter.of(context).go('/firstpage');
            break;
          case 1:
            GoRouter.of(context).go('/search');
            break;
          case 2:
            GoRouter.of(context).go('/post');
            break;
          case 3:
            GoRouter.of(context).go('/MapScreen');
            break;
          case 4:
            GoRouter.of(context).go('/profile');
            break;
        }
      },
    );
  }
}
