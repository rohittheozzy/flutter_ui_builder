import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/flutter_ui_builder.dart';

void main() {
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyTextWidgetTest(),
    );
  }
}

class MyTextWidgetTest extends StatelessWidget {
  final UiBuilderTextConf _textWidgetProps = new UiBuilderTextConf('Build Text', textAlign: TextAlign.left);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            UiBuilderText(_textWidgetProps),
          ],
        ),
      ),
    );
  }
}