// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class LoginBar extends StatefulWidget {
//   const LoginBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _LoginBarState createState() => _LoginBarState();
// }

// class _LoginBarState extends State<LoginBar> {
//   bool isSignUpClicked = false;
//   bool isLoginClicked = true; // Set initial state for login button

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300), // Duration for the animation
//         curve: Curves.easeInOut, // Curve for the animation
//         width: 600.0,
//         height: 60.0,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 149, 207, 255),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildButton(
//               text: 'Sign Up',
//               onPressed: () {
//                 setState(() {
//                   isSignUpClicked = true;
//                   isLoginClicked = false;
//                 });
//                 context.go('/signup');
//               },
//               isSelected: isSignUpClicked,
//             ),
//             _buildButton(
//               text: 'Login',
//               onPressed: () {
//                 if (!isLoginClicked) {
//                   setState(() {
//                     isSignUpClicked = false;
//                     isLoginClicked = true;
//                   });
//                   context.go('/login');
//                 }
//               },
//               isSelected: isLoginClicked,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton({
//     required String text,
//     required VoidCallback onPressed,
//     required bool isSelected,
//   }) {
//     return Expanded(
//       child: TextButton(
//         onPressed: onPressed,
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith<Color>(
//               (Set<MaterialState> states) {
//             if (isSelected) {
//               return Colors.blue; // Color when selected
//             }
//             return Color.fromARGB(255, 149, 207, 255); // Default color
//           }),
//           padding:
//               MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(
//               vertical: 16.0), // Adjust padding to your preference
//           alignment: Alignment.center,
//           child: Text(
//             text,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Color.fromARGB(166, 0, 0, 0),
//               fontSize: 22.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ------------------------------------

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class LoginBar extends StatefulWidget {
//   const LoginBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _LoginBarState createState() => _LoginBarState();
// }

// class _LoginBarState extends State<LoginBar> with RouteAware {
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   bool isSignUpClicked = false;
//   bool isLoginClicked = true; // Set default to login page

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateButtonSelection();
//   }

//   @override
//   void didPush() {
//     _updateButtonSelection();
//   }

//   @override
//   void didPopNext() {
//     _updateButtonSelection();
//   }

//   void _updateButtonSelection() {
//     setState(() {
//       final currentRoute = _navigatorKey.currentState?.widget.initialRoute;
//       // if (currentRoute == '/signup') {
//       //   isSignUpClicked = !isLoginClicked;
//       // } else if (currentRoute == '/login') {
//       //   isLoginClicked = !isSignUpClicked;
//       // }
//       isSignUpClicked = currentRoute == '/signup';
//       isLoginClicked = currentRoute == '/login';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300), // Duration for the animation
//         curve: Curves.easeInOut, // Curve for the animation
//         width: 600.0,
//         height: 60.0,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 149, 207, 255),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildButton(
//               text: 'Sign Up',
//               onPressed: () {
//                 GoRouter.of(context).go('/signup');
//               },
//               isSelected: isSignUpClicked,
//             ),
//             _buildButton(
//               text: 'Login',
//               onPressed: () {
//                 GoRouter.of(context).go('/login');
//               },
//               isSelected: isLoginClicked,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton({
//     required String text,
//     required VoidCallback onPressed,
//     required bool isSelected,
//   }) {
//     return Expanded(
//       child: TextButton(
//         onPressed: onPressed,
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith<Color>(
//             (Set<MaterialState> states) {
//               return isSelected
//                   ? Colors.blue
//                   : const Color.fromARGB(255, 149, 207, 255); // Default color
//             },
//           ),
//           padding:
//               MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(
//               vertical: 16.0), // Adjust padding to your preference
//           alignment: Alignment.center,
//           child: Text(
//             text,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Color.fromARGB(166, 0, 0, 0),
//               fontSize: 22.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBar extends StatefulWidget {
  const LoginBar({Key? key}) : super(key: key);

  @override
  _LoginBarState createState() => _LoginBarState();
}

class _LoginBarState extends State<LoginBar> {
  // Initialize with default route
  String currentRoute = '/login';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Duration for the animation
        curve: Curves.easeInOut, // Curve for the animation
        width: 600.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 149, 207, 255),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
              text: 'Sign Up',
              onPressed: () {
                GoRouter.of(context).go('/signup');
              },
              isCurrentRoute: currentRoute == '/signup',
            ),
            _buildButton(
              text: 'Login',
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              isCurrentRoute: currentRoute == '/login',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required bool isCurrentRoute,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return isCurrentRoute
                  ? Colors.blue
                  : Color.fromARGB(255, 149, 207, 255);
            },
          ),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color:
                  isCurrentRoute ? Colors.white : Color.fromARGB(166, 0, 0, 0),
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
