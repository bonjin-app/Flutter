import 'package:calculator/constants/constants.dart';
import 'package:calculator/widgets/neu_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode = !darkMode;
                        });
                      },
                      child: _switchMode()
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "6.010",
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.red,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "=",
                          style: TextStyle(
                            fontSize: 35,
                            color: darkMode ? Colors.green : Colors.grey,
                          ),
                        ),
                        Text(
                          "10+500*12",
                          style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.green : Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonOval(title: "sin"),
                        _buttonOval(title: "cos"),
                        _buttonOval(title: "tan"),
                        _buttonOval(title: "%"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(
                            title: "C",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(title: "("),
                        _buttonRounded(title: ")"),
                        _buttonRounded(
                            title: "/",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: "7"),
                        _buttonRounded(title: "8"),
                        _buttonRounded(title: "9"),
                        _buttonRounded(
                            title: "x",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: "4"),
                        _buttonRounded(title: "5"),
                        _buttonRounded(title: "6"),
                        _buttonRounded(
                            title: "-",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: "1"),
                        _buttonRounded(title: "2"),
                        _buttonRounded(title: "3"),
                        _buttonRounded(
                            title: "+",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: "0"),
                        _buttonRounded(title: ","),
                        _buttonRounded(
                            icon: Icons.backspace_outlined,
                            iconColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                            title: "=",
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String title,
      double padding = 20,
      IconData icon,
      Color iconColor,
      Color textColor}) {
    return NeuContainer(
      darkMode: darkMode,
      padding: EdgeInsets.all(padding),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: padding * 2,
        height: padding * 2,
        child: Center(
            child: title != null
                ? Text(
                    "$title",
                    style: TextStyle(
                        color: textColor != null
                            ? textColor
                            : darkMode
                                ? Colors.white
                                : Colors.black,
                        fontSize: 30),
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 30,
                  )),
      ),
    );
  }

  Widget _buttonOval({String title, double padding = 20}) {
    return NeuContainer(
      darkMode: darkMode,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: padding * 2,
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
                color: darkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuContainer(
      darkMode: darkMode,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


