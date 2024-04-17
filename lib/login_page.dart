import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeader(),
              _buildEmailField(),
              _buildPasswordField(),
              Expanded(
                child: Container(),
              ),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hello,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome Foodie!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your email and password details to access your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0, // fix photo
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildEmailField() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), 
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "Email Address",
          filled: true,
          fillColor: Color.fromARGB(255, 217, 238, 255),
          // Color.fromARGB(255, 194, 228, 255),
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}


Widget _buildPasswordField() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Password",
          filled: true,
          fillColor: Color.fromARGB(255, 217, 238, 255),
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: // icon eye
                Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}



  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 23, 39),
          borderRadius: BorderRadius.circular(28.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
          child: ElevatedButton(
          onPressed: () => context.go('/profile'),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF092F51),
            padding: EdgeInsets.symmetric(vertical: 24.0),
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
