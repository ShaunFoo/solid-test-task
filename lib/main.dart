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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Color?> _textColorAnimation;

  Color _backgroundColor = ColorUtil.generateRandomColor();
  Color _textColor = ColorUtil.generateRandomColor();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Animation duration
    );

    _containerColorAnimation =
        ColorTween(begin: _backgroundColor, end: _backgroundColor)
            .animate(_controller);
    _textColorAnimation =
        ColorTween(begin: _textColor, end: _textColor).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: _changeColors,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                color: _containerColorAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HELLO THERE',
                      style: GoogleFonts.lilitaOne(
                          textStyle: const TextStyle(fontSize: 50),
                          color: _textColorAnimation.value),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _changeColors() {
    final newBackgroundColor = ColorUtil.generateRandomColor();
    final newTextColor = ColorUtil.generateRandomColor();

    _containerColorAnimation =
        ColorTween(begin: _backgroundColor, end: newBackgroundColor)
            .animate(_controller);
    _textColorAnimation =
        ColorTween(begin: _textColor, end: newTextColor).animate(_controller);

    _controller.forward(from: 0.0);

    setState(() {
      _backgroundColor = newBackgroundColor;
      _textColor = newTextColor;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
