import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_colors_test/constants.dart';

/// this is the home screen.
class HomeScreen extends StatefulWidget {
  /// this is the home screen constructor.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color? _backgroundColor = Colors.white;
  String? generatedColorCode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
        onTap: () => generateRandomColors(),
        child: Scaffold(
          backgroundColor: _backgroundColor,
          appBar: AppBar(
            title: const Text(
              "Background Color Generator",
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.transparent,
            elevation: Constants.appBarElevation,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello there",
                  style: TextStyle(
                    fontSize: Constants.tittleFontSize,
                    fontWeight: FontWeight.w600,
                    color: _backgroundColor == Colors.white
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: Constants.sizedBoxHeight,
                ),
                Text(
                  "generated color code is ${generatedColorCode ?? "FFFFFF"}",
                  style: TextStyle(
                    fontSize: Constants.subTittleFontSize,
                    fontWeight: FontWeight.w600,
                    color: _backgroundColor == Colors.white
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void generateRandomColors() {
    setState(() {
      _backgroundColor = Color(
        (Random().nextDouble() * Constants.colorCode).toInt() << 0,
      ).withOpacity(Constants.colorOpacity);

      generatedColorCode = _backgroundColor?.value
          .toRadixString(Constants.base16Hexadecimal)
          .substring(Constants.subStringValue);
    });
  }
}
