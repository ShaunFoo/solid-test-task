import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_test_task/util/color_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = ColorUtil.generateRandomColor();
  Color _textColor = ColorUtil.generateRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _backgroundColor = ColorUtil.generateRandomColor();
              _textColor = ColorUtil.generateRandomColor();
            });
          },
          child: Container(
            width: double.infinity,
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HELLO THERE',
                  style: GoogleFonts.lilitaOne(
                      textStyle: const TextStyle(fontSize: 50),
                      color: _textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
