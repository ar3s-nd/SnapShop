// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project1/components/login_or_register_google_button.dart";
import "package:project1/components/login_or_register_button.dart";
import "package:project1/components/login_page_textfield.dart";
import "package:project1/services/user_services.dart";

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up user function
  void signUpUser() async {
    // loading circle
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator()
      ); 
    });
  
    // try creating the user
    try {
      if(passwordController.text == confirmPasswordController.text){
        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text
        );

        // create a map of the user details
        Map<String, dynamic> userInfoMap = {
          'Username': usernameController.text,
          'Email': emailController.text,
          'Password': passwordController.text,
          'location': 'not-defined',
          "cart": [],
          'saved': [],
          'total': '0.0'
        };

        // pop the loading circle
        Navigator.pop(context);

        // try adding the user to the database
        await UserService().addUserDetails(userInfoMap, result.user!.uid);
      } else {
        // pop the loading circle
        Navigator.pop(context);
        
        // show error message
        showErrorMessage('Passwords don\'t match.');
      }
    } on FirebaseAuthException catch(e){
      // pop the loading circle
      Navigator.pop(context);
      
      // show error message
      showErrorMessage(e.code);
    } 
  }

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 140, 82, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // app logo   
                SizedBox(height: 15),
                SizedBox(
                  height: 150, 
                  width: 150,    
                  child: Image.asset(
                    'lib/images/snapshop.png',
                    height: 200.0,
                  )
                ),
                
                // make an account
                SizedBox(height: 15),
                Text(
                  'Let\' make an account for you!',
                  style: TextStyle(
                    color: Colors.grey[300], 
                    fontSize: 21,
                  )
                ),

                // name
                SizedBox(height:10),
                LoginPageTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                // email
                SizedBox(height:10),
                LoginPageTextField(
                  controller: emailController,
                  hintText: 'E-Mail',
                  obscureText: false,
                ),
                
                // password
                SizedBox(height:10),
                LoginPageTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                
                // confirm password
                SizedBox(height:10),
                LoginPageTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                
                // sign up button
                SizedBox(height: 20),
                LoginPageButton(
                  onTap: signUpUser,
                  text: "Sign Up"
                ),
            
                // Or continue with
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[700],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[400]
                          )
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
            
                // google button
                SizedBox(height: 15),
                GoogleSignInButton(),
            
                // Already have an account
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now',
                        style: TextStyle(color: Colors.blue[500])  
                      ),
                    )
                  ],
                ),
              ]
            ),
          )
        )
      )
    );
  }
}