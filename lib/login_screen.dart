import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: SafeArea(
        child: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'octane' && _passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => HomeScreen(username: _usernameController.text, password: _passwordController.text)),
      );
      // Show a notification for successful login
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Login Successful'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show a notification for unsuccessful login
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid username or password'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoFormSection.insetGrouped(
                    header: const Text(
                      'Login with your credentials',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      CupertinoTextFormFieldRow(
                        controller: _usernameController,
                        placeholder: 'Username',
                        placeholderStyle: const TextStyle(color: CupertinoColors.white),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.all(16.0),
                        // Set the background color to transparent
                        decoration: const BoxDecoration(
                          color: Color(0x00000000),
                        ),
                      ),
                      CupertinoTextFormFieldRow(
                        controller: _passwordController,
                        placeholder: 'Password',
                        obscureText: true,
                        placeholderStyle: const TextStyle(color: CupertinoColors.white),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.all(16.0),
                        // Set the background color to transparent
                        decoration: const BoxDecoration(
                          color: Color(0x00000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 200.0,
                    child: CupertinoButton.filled(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Or sign in with:',
                    style: TextStyle(color: CupertinoColors.white, fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginOptionButton(
                        image: '../assets/google.png',
                        label: 'Google',
                        onPressed: () {
                          // Implement Google login
                        },
                      ),
                      const SizedBox(width: 16.0),
                      LoginOptionButton(
                        image: '../assets/fb.png',
                        label: 'Facebook',
                        onPressed: () {
                          // Implement Facebook login
                        },
                      ),
                      const SizedBox(width: 16.0),
                      LoginOptionButton(
                        image: '../assets/apple.png',
                        label: 'Apple',
                        onPressed: () {
                          // Implement Apple login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginOptionButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed;

  LoginOptionButton({required this.image, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(color: CupertinoColors.white, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
