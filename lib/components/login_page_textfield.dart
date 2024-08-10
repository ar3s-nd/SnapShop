// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPageTextField extends StatelessWidget{
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;

  const LoginPageTextField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.obscureText, 
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText, // if the textfield is used for passwords, obscuretext = true else false
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(18.0)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)), 
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText, // show the hint text to hint the user to type either username/password/ confirm password.
          hintStyle: TextStyle(color: Colors.grey.shade600)
        )
      ),
    );
  }
}