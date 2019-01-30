import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('关于'),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: null,
        ),
      ),    
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
    );
  }
}