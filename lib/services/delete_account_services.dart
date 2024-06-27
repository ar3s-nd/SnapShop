import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/pages/auth_page.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  // button to delete the current account even from firebase  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(
        'lib/images/icons/delete.svg', 
        color: Colors.red, 
        semanticsLabel: 'Delete Acount',
        ),
      onPressed: () => _deleteAccount(context),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.red;
            }
            return const Color.fromARGB(0, 255, 0, 0);
          },
        ),
      ),
      label: const Text(
        'Delete Account',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ) 
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    
    if (user != null) {
      // Show confirmation dialog
      bool confirm = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete Account"),
            content: const Text("Are you sure you want to delete your account? This action is irreversible."),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text("Delete"),
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        try {
          // Delete user account
          await user.delete();

          // Navigate to a logged out state or home page
          // ignore: use_build_context_synchronously
          const AuthPage();
        } on FirebaseAuthException catch(e){
          // Show error message or handle errors

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.blue,
                title: Center(
                  child: Text(
                    e.code,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  )
                )
              );
            }
          );
        }
      }
    }
  }
}
