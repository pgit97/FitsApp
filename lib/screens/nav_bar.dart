import 'package:fitsApp/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'BMI/home.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         'John Doe',
          //       ),
          //
          //     ],
          //   ),
          DrawerHeader(
            child: Text(
              'FitsApp',
              style: TextStyle(color: Colors.white, fontSize: 25),

            ),
              //
              // icon: Icon(Icons.home, color: Color(0xFF0A0E21),size: 27),
              // onPressed: () => Navigator.of(context).pop(),

            decoration: BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Dashboard'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text('Workout'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),),
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Calculate BMI'),
            onTap: () =>
            {Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()),),
            },
          ),
               ListTile(
                      leading: Icon(Icons.border_color),
                     title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),

        ],
      ),
    );
  }
}