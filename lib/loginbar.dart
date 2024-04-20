// loginbar.dart
import 'package:flutter/material.dart';

class LoginBar extends StatefulWidget {
  final ValueChanged<bool> onLoginSelected;
  final bool isLoginSelected;

  const LoginBar({
    Key? key,
    required this.onLoginSelected,
    required this.isLoginSelected,
  }) : super(key: key);

  @override
  _LoginBarState createState() => _LoginBarState();
}

class _LoginBarState extends State<LoginBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onLoginSelected(!widget.isLoginSelected);
      },
      child: Container(
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 217, 238, 255),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: widget.isLoginSelected ? 20 : 220,
              top: 0,
              bottom: 0,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: widget.isLoginSelected ? Colors.black : Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: widget.isLoginSelected ? Colors.grey : Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
