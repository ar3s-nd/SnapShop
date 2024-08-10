import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/svg.dart";
import "package:project1/components/profile_page_textfield.dart";
import "package:project1/services/delete_account_services.dart";
import "package:project1/services/user_services.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = 'not-defined';
  String email = 'not-defined';
  String location = 'not-defined';

  TextEditingController usernameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async { // get username, email and location from firestore
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('User').doc(currentUser.uid).get();
        if (userDoc.exists) {
          setState(() {
            username = userDoc['Username'];
            email = userDoc['Email'];
            location = userDoc['location'];
          });
        }
      }
    } catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 325,
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
                // user image
                SvgPicture.asset(
                  'lib/images/icons/user_image.svg',
                  color: Colors.white,
                  height: 175,
                ),

                // username
                Text(
                  username,
                  style:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  )
                ),

                // user email
                const SizedBox(height: 10,),
                Text(
                  email,
                  style:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  )
                ),

                // show user location and edit profile button 
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // location
                    SizedBox(width: 60),
                    Text(
                      location,
                      style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      )
                    ),

                    // edit profile
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: (){
                          usernameController.text = username;
                          locationController.text = location;
                          editProfile(FirebaseAuth.instance.currentUser!.uid);
                        },
                        icon: Icon(Icons.edit, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // logout button
          const SizedBox(height: 100),
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

          // delete account button
          const SizedBox(height: 30),
          const DeleteAccountButton(),
        ],
      ),
    );
  }
  
  // show pop-up dialog to edit user profile 
  Future editProfile(String id) => showDialog(context: context, builder: (context) => SingleChildScrollView(
    child: AlertDialog(
      content: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  // cross icon to pop the current context
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
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20
                  )
                ),
              ],
            ),

            // edit username
            SizedBox(height: 40,),
            Text(
              'Username',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
              ),
            ),
            ProfilePageTextfield(controller: usernameController),
            
            // edit location
            SizedBox(height: 30,),
            Text(
              'Location',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
              ),
            ),
            ProfilePageTextfield(controller: locationController),
            
            // update button
            SizedBox(height:50),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> updateInfo = {
                  'Username': usernameController.text,
                  'location': locationController.text
                };
                await UserService().updateProfile(FirebaseAuth.instance.currentUser!.uid, updateInfo);
                fetchUserData();
                if(Navigator.canPop(context)) Navigator.pop(context);
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
                'Update',
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