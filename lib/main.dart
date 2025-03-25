import 'package:flutter/material.dart';
import 'HomePage_JMSD.dart';
import 'signup_JMSD.dart'; // Import the SignUpPage

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(255, 32, 120, 179),
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
    home: Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: Center(
        child: LoginForm(),
      ),
    ),
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage_JMSD()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both username and password'),
        ),
      );
    }
  }

  void _handleSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Login.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text(
          'Sign In',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Please enter your details'),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _handleLogin,
          child: Text('Login'),
        ),
        SizedBox(height: 10), // Spacing between buttons
        ElevatedButton(
          onPressed: _handleSignUp,
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}
