import 'package:firebase_core/firebase_core.dart';
import 'package:fitsApp/Todo/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(FitsTodo());
// }




class FitsTodo extends StatefulWidget {


  static final String title = 'Todo App With Firebase';

  @override
  _FitsTodoState createState() => _FitsTodoState();
}

class _FitsTodoState extends State<FitsTodo> {
  @override

  void initState() {

    // TODO: implement initState
    super.initState();
   this.initFirebase();
  }
 Future<void> initFirebase()async{
   await Firebase.initializeApp();
 }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: FitsTodo.title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xFFf6f5ee),
      ),
      home: HomePage(),
    ),
  );
}
