// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/svg.dart";
import "package:project1/components/login_or_register_google_button.dart";
import "package:project1/components/login_or_register_button.dart";
import "package:project1/components/login_page_textfield.dart";
import "package:project1/components/profile_page_textfield.dart";

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user function
  void signInUser() async {
    // loading circle
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator()
      ); 
    });
  
    // try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );
      
      // pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      // pop the loading circle
      // ignore: use_build_context_synchronously
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
                SizedBox(height: 20),
                SizedBox(
                  height: 200, 
                  width: 200,    
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'lib/images/snapshop.png',
                      height: 200.0,
                    ),
                  )
                ),
                
                // Welcome back
                SizedBox(height: 30),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.grey[300], 
                    fontSize: 22,
                  )
                ),
            
                // email
                SizedBox(height:30),
                LoginPageTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                
                // password
                SizedBox(height:10),
                LoginPageTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                
                // forgot password
                GestureDetector(
                  onTap: forgotPassword,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // sign in button
                SizedBox(height: 20),
                LoginPageButton(
                  onTap: signInUser,
                  text: 'Sign In'
                ),
            
                // Or continue with
                SizedBox(height: 30),
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
            
                // google sign in button
                SizedBox(height: 30),
                GoogleSignInButton(),
            
                // register now
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap, // go to register page by toggling the pages
                      child: Text(
                        'Register Now',
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

  Future forgotPassword() => showDialog(context: context, builder: (context) => SingleChildScrollView(
    child: AlertDialog(
      content: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'lib/images/icons/cross_icon.svg',
                  ),
                  onPressed: () {
                    if(Navigator.canPop(context)){
                      Navigator.pop(context);
                    }
                  }
                ),
                SizedBox(width: 20),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20
                  )
                ),
              ],
            ),
            SizedBox(height: 40,),
            Text(
              'Enter your email',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
              ),
            ),
            ProfilePageTextfield(controller: emailController),
            
            SizedBox(height:50),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((_) {
                  if(Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  showErrorMessage("Link has been sent to your email for password reset");
                }).catchError((error) {
                    showErrorMessage(error.message.toString());
                });
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
              child: const Text(
                'Send email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ) 
            ),
          ],
        )
      ),
    ),
  ));
}