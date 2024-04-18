import 'package:flutter/material.dart';

class loginBar extends StatelessWidget {
  final Function onSignupPressed;
  final Function onLoginPressed;

  const loginBar(
      {Key? key, required this.onSignupPressed, required this.onLoginPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Container(
          width: 550.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 116, 192, 255),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => onSignupPressed(),
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onLoginPressed(),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}