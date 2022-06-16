import 'package:flutter/material.dart';
import 'package:search_list_futter/example2/search_page2.dart';
import 'package:search_list_futter/example3_original/example3.dart';



import 'example1/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      // home: SearchPage(),
      home: Example3Page(),
    );
  }
}
