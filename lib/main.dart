import 'package:flutter/material.dart';
import 'package:myapp/form/form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'belajar flutter',
      theme: ThemeData(primaryColor: Colors.blue),
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
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Flutter'),
        ),
        body: FormPage()
      ),
      // body: 
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Hitungan ke :'),
      //       Text('$_counter',
      //       style: TextStyle(
      //         fontSize: _counter.toDouble(),
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black,
      //       ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //         Container(
      //         child: TextButton(
      //           onPressed: (){
      //             incrementCounter();
      //           },
      //           child: Icon(Icons.add),
      //         ),
      //       ),
      //       Container(
      //         child: TextButton(
      //           onPressed: (){
      //             decrementCounter();
      //           },
      //           child: Icon(Icons.remove),
      //           ),
      //         ),
      //         ],
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
