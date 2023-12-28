import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String password;

  HomeScreen({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Show a confirmation dialog before logging out
            showLogoutConfirmationDialog(context);
          },
          child: Icon(CupertinoIcons.power),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Show user details on user icon click
            showUserDetailsDialog(context, username, password);
          },
          child: Icon(CupertinoIcons.person),
        ),
      ),
      child: SafeArea(
        child: HomeBody(username: username),
      ),
    );
  }

  void showUserDetailsDialog(BuildContext context, String username, String password) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('User Details'),
          content: Column(
            children: [
              Text('Username: $username'),
              Text('Password: $password'), // Note: Showing the password is not recommended in a real app
            ],
          ),
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

  void showLogoutConfirmationDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: const Text('Logout',style: TextStyle(color: Colors.red),),
              onPressed: () {
                // Navigate to the LoginScreen on logout
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class HomeBody extends StatelessWidget {
  final String username;

  HomeBody({required this.username});

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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Welcome, $username!',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400, // Adjust the font weight here
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // Add your home screen content here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
