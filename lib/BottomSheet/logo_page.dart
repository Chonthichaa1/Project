// import 'package:flutter/material.dart';

// class LogoScreen extends StatefulWidget {
//   const LogoScreen({Key? key}) : super(key: key);

//   @override
//   _LogoScreenState createState() => _LogoScreenState();
// }

// class _LogoScreenState extends State<LogoScreen> {
//   @override
//   void initState() {
//     super.initState();

//     // Add a delay for 4 seconds before navigating to the next screen
//     _playLogo();
//   }

//   void _playLogo() async {
//     // Add a delay before navigating to the next screen
//     await Future.delayed(const Duration(seconds: 4));
//     Navigator.pushNamed(context, '/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Image.asset(
//           'assets/logo.png',
//           width: 200, 
//           height: 200,
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';


// class LogoScreen extends StatefulWidget {
//   const LogoScreen({Key? key}) : super(key: key);

//   @override
//   _LogoScreenState createState() => _LogoScreenState();
// }

// class _LogoScreenState extends State<LogoScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _playLogo();
//   }

//   void _playLogo() async {
//     // เพิ่มการเลื่อนหน้าไปที่หน้าหลักหลังจากเล่นโลโก้เป็นเวลา 4 วินาที
//     await Future.delayed(const Duration(seconds: 4));

//     // เปลี่ยนเส้นทางด้วย GoRouter
//     GoRouter.of(context).go('/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Image.asset(
//           'assets/fav.png',
//           width: 200,
//           height: 200,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const LogoApp());

class LogoApp extends StatefulWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4), // Set duration to 4 seconds
      vsync: this,
    );

    // Use CurvedAnimation to add easing effect (optional)
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    // Setup animation with Tween value
    animation = Tween<double>(begin: 0, end: 200).animate(curve);

    controller.forward(); // Start animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: const FlutterLogo(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/login'); // Use GoRouter to navigate
        },
        child: const Icon(Icons.login),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Login Page'),
      ),
    );
  }
}







