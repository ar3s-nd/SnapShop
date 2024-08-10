import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/pages/cart_page.dart';
import 'package:project1/pages/favorite_page.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/profile_page.dart';

class HomeFavOrProfPage extends StatefulWidget {
  const HomeFavOrProfPage({super.key});

  @override
  State<HomeFavOrProfPage> createState() => _HomeFavOrProfPageState();
}

class _HomeFavOrProfPageState extends State<HomeFavOrProfPage> {
  final user = FirebaseAuth.instance.currentUser!;

  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const FavoritePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SnapShop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
        actions: [
          // show cart icon
          IconButton(
            icon: SvgPicture.asset(
              'lib/images/icons/cart_icon/cart_unselected.svg', 
              color: Colors.white, 
              semanticsLabel: 'Logout',
            ),
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const CartPage(),            
              )
            ),
          )
        ],
      ),

      body: pages[currentIndex], // show home/ favourites/ profile page, default is home page 

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items:  [
          // bottom navigation bar which shows different icons for selected and unselected cases
          BottomNavigationBarItem(
            label: "Home",
            icon: currentIndex == 0? SvgPicture.asset(
              'lib/images/icons/home_icon/home_selected.svg', 
              color: Colors.deepPurple, 
              semanticsLabel: 'Home', 
            ): SvgPicture.asset(
              'lib/images/icons/home_icon/home_unselected.svg', 
              color: Colors.black, 
              semanticsLabel: 'Home', 
            ),
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1? const Icon(
              Icons.favorite_sharp,
              color: Colors.deepPurple
            ): const Icon(
              Icons.favorite_border_sharp,
              color: Colors.black,
            ),
            label: "Saved"
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2? SvgPicture.asset(
              'lib/images/icons/user_icon/user_selected.svg', 
              color: Colors.deepPurple, 
              semanticsLabel: 'User', 
            ): SvgPicture.asset(
              'lib/images/icons/user_icon/user_unselected.svg', 
              color: Colors.black, 
              semanticsLabel: 'User', 
            ), 
            label: 'Profile'
          )
        ],
      ),
    );
  }
}