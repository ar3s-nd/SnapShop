import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/home_fav_prof_page.dart';
import 'package:project1/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){  // if user is logged in, go to home/favourite/profile page
            return const HomeFavOrProfPage();
          } else {               // if user is not logged in, go to login/register page
            return const LoginOrRegisterPage();
          }
        }
      )
    );
  }
}