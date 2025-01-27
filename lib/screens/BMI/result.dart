import 'package:fitsApp/screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'components/bottom_button.dart';
import 'components/reusable_card.dart';
import 'constants.dart';
// import 'Dash';


class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      // onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => InputPage()),
      //
      //   );
      // },

      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home, color: Color(0xFF0A0E21),size: 27),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>Dashboard()
              ),
            ),
          ),
          title: Row(
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
                Center(child: Text('BMI CALCULATOR'))
              ]
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
