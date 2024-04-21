import 'package:flutter/material.dart';
import 'package:login/loginbar.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  static final UserData _singleton = UserData._internal();
  factory UserData() {
    return _singleton;
  }
  UserData._internal();

  String emailf = '';
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoginSelected = true;
  final _confirmPasswordController = TextEditingController();


  void _updateLoginSelected(bool selected) {
    setState(() {
      _isLoginSelected = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void _signUp() async {
    // Check if passwords match
    if (!_isValidEmail(_emailController.text.trim())) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid Email"),
              content: Text("Please enter a valid email address."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    if (!_checkPasswordMatch()) {
      // Show a pop-up if passwords don't match
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Password Not Match"),
            content: Text("The passwords entered do not match. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Exit the function early
    }

    // Initialize Firebase Firestore
    final firestore = FirebaseFirestore.instance;

    // Get values from TextControllers
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Add data to Firebase Firestore
    try {
      await firestore.collection('users').add({
        'email': email,
        'password': password,
        'profileImage': '',
        'pronouns':'',
        'region':'',
        'username':'',
        'bio':'',
        'age':'',

        
      });
      UserData().emailf = email; // กำหนดค่าอีเมลให้กับ Singleton Class
      // Close the Sign Up page or do anything else you want
    } catch (e) {
      // If there's an error adding data
      print('Error adding user: $e');
    }
  }

  void _login() async {
    try {
      // Validate email format
      if (!_isValidEmail(_emailController.text.trim())) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid Email"),
              content: Text("Please enter a valid email address."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      // ดึงข้อมูลจาก Firebase Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users')
          .where('email', isEqualTo: _emailController.text.trim())
          .where('password', isEqualTo: _passwordController.text.trim())
          .get();

      // ตรวจสอบว่ามีข้อมูลที่ตรงกันหรือไม่
      if (querySnapshot.docs.isNotEmpty) {
        // ถ้าตรงกัน ให้ทำการนำทางไปยังหน้า firstpage
        UserData().emailf = _emailController.text.trim();
        context.go('/firstpage');
      } else {
        // ถ้าไม่ตรงกัน ให้แสดงกล่องข้อความแจ้งเตือนว่า "Email or password is incorrect."
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text("Email or password is incorrect."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิดกล่องข้อความ
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // หากเกิดข้อผิดพลาดในการเข้าถึง Firebase Firestore
      print('Error logging in: $e');
      // แสดงข้อความแจ้งเตือนว่ามีข้อผิดพลาด
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while logging in. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิดกล่องข้อความ
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  bool _checkPasswordMatch() {
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    return password == confirmPassword;
  }

  bool _isValidEmail(String email) {
    // Simple email validation using RegExp
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
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
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
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
          keyboardType: TextInputType.emailAddress, // Set email keyboard type
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "Email Address",
            filled: true,
            fillColor: Color.fromARGB(255, 217, 238, 255),
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
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
          borderRadius: BorderRadius.circular(30.0),
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
              icon: _obscureText
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
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
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(38.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _login,
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 15, 53, 86),
            padding: EdgeInsets.symmetric(vertical: 24.0),
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: TextFormField(
          obscureText: _obscureText,
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintText: "Confirm Password",
            filled: true,
            fillColor: Color.fromARGB(255, 217, 238, 255),
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: _obscureText
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(38.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            _updateLoginSelected(true);
            _signUp();
          },
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 15, 53, 86),
            padding: EdgeInsets.symmetric(vertical: 24.0),
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildHeader(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          LoginBar(
                            onLoginSelected: _updateLoginSelected,
                            isLoginSelected: _isLoginSelected,
                          ),
                          _buildEmailField(),
                          _buildPasswordField(),
                          if (!_isLoginSelected) _buildConfirmPasswordField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: _isLoginSelected
                    ? _buildLoginButton()
                    : _buildSignUpButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
