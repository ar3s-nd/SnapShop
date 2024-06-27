import 'package:flutter/material.dart';
import 'package:project1/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/providers/cart_provider.dart';
import 'package:project1/providers/favorite_provider.dart';
import 'package:project1/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final userProvider = UserProvider();
  await userProvider.loadUser();  // Load user data before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    // providers
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MaterialApp(
      title: 'SnapShop',
      debugShowCheckedModeBanner: false,
      home: AuthPage(), 
    )
  );
}