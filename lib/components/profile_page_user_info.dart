import 'package:flutter/material.dart';

class ProfilePageUserInfo extends StatelessWidget {
  final String text1, text2; 
  const ProfilePageUserInfo({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$text1:',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(10), 
              border: Border.all(
                color: Colors.grey[400]!, 
                width: 2,
              ),
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                right: 8,
                left: 8
              ),
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}