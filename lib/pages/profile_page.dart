import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:project1/services/delete_account_services.dart";
import "package:project1/providers/user_provider.dart";
import "package:provider/provider.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
            color: Colors.deepPurple[400]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'lib/images/icons/user_image.svg',
                color: Colors.white,
                height: 150,
              ),
              Text(
                user.username,
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                )
              ),
              const SizedBox(height: 10,),
              Text(
                user.email,
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                )
              ),
            ],
          ),
        ),

        const SizedBox(height: 150),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
              'lib/images/icons/logout.svg', 
              color: Colors.deepPurple, 
              semanticsLabel: 'Logout',
            ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
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
          label: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ) 
        ),

        const SizedBox(height: 30),
        const DeleteAccountButton(),
      ],
    );
  }
}