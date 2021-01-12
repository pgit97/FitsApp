import 'package:firebase_core/firebase_core.dart';
import 'package:fitsApp/Todo/todos.dart';
import 'package:fitsApp/screens/onBoarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// void main() => runApp(MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),

    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:AppBarTheme(
          color:Colors.blueAccent
        ),

        primarySwatch: Colors.blue,
      ),
      home:OnboardingScreen(),
    ),
  );
  }


