import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePageTextfield extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ProfilePageTextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}