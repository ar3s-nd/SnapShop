import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget{
  final Function()? onPressed;

  const GoogleSignInButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton.icon(
      onPressed: onPressed,
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
      icon: Image.asset(
        'lib/images/google.png',
        height: 55, 
        width: 55,
      ), 
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