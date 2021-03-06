import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roomie_lah/constants.dart';
import 'package:roomie_lah/controllers/AlgorithmController.dart';
import 'package:roomie_lah/controllers/MatchController.dart';
import 'package:roomie_lah/screens/WelcomeScreen.dart';
import 'package:roomie_lah/screens/recommendation_screen.dart';
import 'package:roomie_lah/screens/chat_list.dart';
import 'package:roomie_lah/screens/ConversationScreen.dart';
import 'package:roomie_lah/screens/SignupScreen.dart';
import 'package:roomie_lah/screens/LoginScreen.dart';
import 'package:roomie_lah/screens/UserProfileScreen.dart';
import 'package:roomie_lah/screens/EditProfileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //MatchController().addMatch('pratyush', 'atul');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoomieLah',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        RecommendationScreen.id: (context) => RecommendationScreen(),
        ChatListPage.id: (context) => ChatListPage(),
        ConversationScreen.id: (context) => ConversationScreen(
              chatWithUsername: 'atul',
              profilePicURL: '',
            ),
        UserProfileScreen.id: (context) => UserProfileScreen(),
        EditProfileScreen.id: (context) => EditProfileScreen(
              firstTime: false,
            )
      },
    );
  }
}
