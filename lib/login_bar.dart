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
      padding: const EdgeInsets.only(top:20.0),
      child: Container(
        child: Container(
          width: 600.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 149, 207, 255),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => onSignupPressed(),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(166, 0, 0, 0),
                    fontSize: 22.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onLoginPressed(),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color.fromARGB(166, 0, 0, 0),
                    fontSize: 22.0,
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