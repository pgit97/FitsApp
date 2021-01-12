import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitsApp/screens/hub_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'exercise_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String apiURL ="https://raw.githubusercontent.com/pgit97/pgit.github.io/master/exercise.json";
      

      ExerciseHub exerciseHub;

  Object get error => null;

      @override
      void initState() { 

          getExcercise();
  
        super.initState();
      }

      void getExcercise() async{
        
        var rep = await http.get(apiURL);
        var body=rep.body;

        var decodeJson=jsonDecode(body);
        exerciseHub=ExerciseHub.fromJson(decodeJson);
        setState(() {
          
        });

       print(exerciseHub);

      }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
      primaryColor: Colors.pink,
      scaffoldBackgroundColor: Colors.grey,
    ),
    home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home, color: Color(0xFF0A0E21),size: 27),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title:Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  height: 37,
                ),
                SizedBox(
                  width: 20,
                ),
                Center(child: Text('FitsApp'))
      //       Container(
      //           padding: const EdgeInsets.all(8.0), child: Text('FitsApp'))
              ]
          ),
        ),
       body: exerciseHub != null ? ListView(

         children:exerciseHub.exercises.map((value)=>
         InkWell(
           onTap: (){
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => ExerciceScreen(exercises:value)));
           },
           child: Hero(
             tag: value.id,
                        child: Container(
               margin: EdgeInsets.all(15.0),
             
               child:Stack(
                 children: <Widget>[
                    ClipRRect(
                       borderRadius: BorderRadius.circular(16),
                                       child: CachedNetworkImage(
                       imageUrl: value.thumbnail,
                                    placeholder: (context, url) => Image(
                                      image: AssetImage("assets/placeholder.jpg"),
                                      fit: BoxFit.cover,
                                      height: 1250,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: 250,
                                     // print(context);
                                     width: MediaQuery.of(context).size.width,

                        ),

                    ),
                      ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                     colors: [
                                      Color(0xFF000000),
                                      Color(0x00000000),
                                    ],
                                    // begin: Alignment.topLeft,
                                    // end: Alignment.centerLeft,
                                  )),
                                ),
                              ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      
                      alignment: Alignment.bottomLeft,
                      child:Text(value.title,style:TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                      ),)
                    )
                 ],
               )
             ),
           ),
         )
         ).toList()
       )
         :LinearProgressIndicator()

    )

    );

  }
}