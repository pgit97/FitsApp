// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class Diets extends StatefulWidget {
//   @override
//   _DietsState createState() => _DietsState();
// }
//
// class _DietsState extends State<Diets> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               title: Text('DIET PLAN'),
//               backgroundColor: Colors.accent,
//               centerTitle: true,
//             ),
//             body: Center(
//                 child: DietsUser()
//             )
//         )
//     );
//   }
// }
// class DietsUser extends StatefulWidget {
//   DietsUserState createState() => DietsUserState();
// }
//
// class DietsUserState extends State {
//
// //  Declaring Variables
//   Future<dynamic> futureDiets;
//   List diets=List();
//   var isLoading = false;
//
//   //Fetch Diet using API
//   Future<Diets_data> fetchDiets() async {
//     setState((){
//       isLoading = true;
//     });
//     var res=await http.post(Uri.encodeFull(url), body:{'Identifier':''},
//         headers:{"charset":"utf-8","Content-Type": "application/x-www-form-urlencoded","Accept":"application/json"},
//     );
//
//     setState(() {
//       isLoading = false;
//     });
//     print(res.statusCode);
//     print(res.body);
//     print(json.decode(res.body));
//     setState((){
//       diets=json.decode(res.body);
//     });
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     futureDiets= fetchDiets();
//     print(futureDiets);
//   }
//
//   @override
//    Widget build(BuildContext context)  {
//
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body:  isLoading
//         ? Center(
//         child: CircularProgressIndicator(),
//     )
//         :
//     Container(
//         child:Column(
//           children: <Widget>[
//
//               Expanded(
//                   child:Container(
//                     child:ListView.builder(
//                         itemCount: diets.length,
//                         itemBuilder: (BuildContext context,int index){
//                           return Card(
//                             child: Container(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(0.0),
//                                     child: Row(
//                                       children: <Widget>[
//                                         Expanded(
//                                           child: Image.network(
//                                             '${diets[index]['Image']}',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
// //
//                                   Container(
//                                     color:Colors.white,
//                                     padding: const EdgeInsets.all(15),
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           /*1*/
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               /*2*/
//                                               Container(
//                                                 child: Text(
//                                                   'Topic: ${diets[index]['FoodName']}',
//                                                   style: TextStyle(
//                                                     fontSize: 18.0,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 '(${diets[index]['Time']})',
//                                                 style: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 'Cost: ${diets[index]['About']}',
//                                                 style: TextStyle(
//                                                   color: Colors.red[900],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Divider(color: Colors.grey.shade400, indent:0.0, height: 1.0),
//                                 ],
//                               ),
//
//                             ),
//                           );
//                         }
//                     ),
//                   )
//
//               )
//           ],
//         )
//
//       )
//     );
//   }
// }