import "package:flutter/material.dart";

class LoginPageButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const LoginPageButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context){
    // return the button 
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return const Color.fromARGB(255, 47, 143, 207).withOpacity(0.8);
            }
            return Colors.transparent;
          },
        ),
      ),

      // text could be either sign in or sign up
      child: SizedBox(
        height: 50,
        width: 200,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          )
        ),
      ),
    );
  }
}