import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/services/auth_services.dart';
import 'package:project1/services/user_services.dart';
import 'package:random_string/random_string.dart';

class GoogleSignInButton extends StatefulWidget{

  const GoogleSignInButton({super.key,});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
    void showErrorMessage(String errorMessage){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              errorMessage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),

            )
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return ElevatedButton.icon(
      onPressed: () async {
        try{
          // try sign in or sign up with google
          await AuthService().signInWithGoogle();

          // default data for the user to be stored in firestore
          Map<String, dynamic> userInfoMap = {
            'Username': 'not-defined',
            'Email': FirebaseAuth.instance.currentUser!.email,
            'Password': randomString(8),
            'location': 'not-defined',
            "cart": [],
            'saved': [],
            'total': '0.0'
          };

          // try adding the user to the database
          await UserService().addUserDetails(userInfoMap, FirebaseAuth.instance.currentUser!.uid);
        } catch(e){
          showErrorMessage('channel-error');
        }
      },
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Color.fromARGB(255, 47, 143, 207).withOpacity(0.8);
            }
            return Colors.transparent;
          },
        ),
      ),

      // Google logo
      icon: Image.asset(
        'lib/images/google.png',
        height: 55, 
        width: 55,
      ), 

      // Text 'Google'
      label: Text(
        'Google ',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}