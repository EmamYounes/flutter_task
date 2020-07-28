import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/top_destinations/view/TopDestinationsListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Color(0xFFF5F5F5),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            buildTextTitle(),
            buildListIcons(),
            SizedBox(
              height: 20,
            ),
            buildTopDestinationsTitle(),
            TopDestinationsListView(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center buildListIcons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Color(0xFFEEEEEE), // button color
              child: InkWell(
                splashColor: Colors.cyan, // inkwell color
                child:
                    SizedBox(width: 56, height: 56, child: Icon(Icons.flight)),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          ClipOval(
            child: Material(
              color: Color(0xFFEEEEEE), // button color
              child: InkWell(
                splashColor: Colors.cyan, // inkwell color
                child: SizedBox(
                    width: 56, height: 56, child: Icon(Icons.directions_car)),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          ClipOval(
            child: Material(
              color: Color(0xFFEEEEEE), // button color
              child: InkWell(
                splashColor: Colors.cyan, // inkwell color
                child: SizedBox(
                    width: 56, height: 56, child: Icon(Icons.device_hub)),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          ClipOval(
            child: Material(
              color: Color(0xFFEEEEEE), // button color
              child: InkWell(
                splashColor: Colors.cyan, // inkwell color
                child: SizedBox(
                    width: 56, height: 56, child: Icon(Icons.motorcycle)),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildTopDestinationsTitle() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Top Destinations',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'see all',
            style: TextStyle(
                fontSize: 14,
                color: Colors.cyan,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  Widget buildTextTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'What you would like to find?',
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
