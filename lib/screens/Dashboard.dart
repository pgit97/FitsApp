import 'package:fitsApp/Todo/home.dart';
import 'package:fitsApp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'BMI/home.dart';
import 'nav_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
      primaryColor: Colors.pink,
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
     home: Scaffold(
       drawer: NavDrawer(),
       appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 37,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Dashboard')
    )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height:100.0,
            ),
            Row(
              children: <Widget>[
               Center(
                 child: RaisedButton(
            color: Colors.deepPurple,
                      child: Row(
                   children: <Widget>[
                         Text('Workout',
                  style: TextStyle(
                  color: Colors.white
             ),
                     ),
          ],
       ),
                      onPressed: () {
                       Navigator.push(
                       context,
                     MaterialPageRoute(
                    builder: (context) => InputPage()),

                       );
    },
         ),
               ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(
              height:200.0,
            ),
            Row(
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    child: Row(
                      children: <Widget>[
                        Text('Workout',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    child: Row(
                      children: <Widget>[
                        Text('track Hospital nearby',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FitsTodo()),
                      );
                    },
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    )
    );
  }
}
