import 'package:flutter/material.dart';
import 'package:implicit_animations/switcher_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit animations"),
      ),
      body: Center(
        child: SwitcherWidget(title: "Ativo",initialValue: true, onChanged: (value){
            print(value);
        },)
      ),
    );
  }
}
