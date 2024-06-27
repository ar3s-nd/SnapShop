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
          if(snapshot.hasData){  // user is logged in
            return const HomeFavOrProfPage();
          } else {               // user is not logged in
            return const LoginOrRegisterPage();
          }
        }
      )
    );
  }
}