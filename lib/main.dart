import 'package:auto_size_text/auto_size_text.dart';
import 'package:chabad_tv/frontend/home_cards.dart';
import 'package:chabad_tv/network/requests.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'utilities/constants.dart';

void main() => runApp(MyApp());

//10.139.173.234

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

Widget HomeWidget() {
  void getHTML() async {
    await Requests.getShabbatTimes();
    final _targetUrl =
        'https://www.hebcal.com/shabbat/?geo=geoname&amp;geonameid=4682464&amp;m=50&amp;cfg=j&amp;tgt=_top';
    var response = await http.get(_targetUrl);
    Future getFeed() => http.get(_targetUrl).then((xmlString) => xmlString);
    print(response.body);
  }

  final List<FocusNode> focusNodes = List();
  FocusNode focus = FocusNode();
  focusNodes.add(focus);
  return Scaffold(
    appBar: AppBar(
    

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              AutoSizeText("Welcome to Chabad of A&M!", minFontSize: 45,style: TextStyle(color: Colors.white,fontFamily: 'Great Vibes'),),
              AutoSizeText("Home of the 12th Mensch",style: TextStyle(color: Colors.white,) ),

            ],
          ),
        )),
      ),
      backgroundColor: Constants.maroon,
    ),
    body: HomeCards(),
  );
}
