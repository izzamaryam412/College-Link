import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
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
  void initState() {
    super.initState();
    // Set a timer to navigate to LoginPage after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double circleWidth = constraints.maxWidth * 1;
          double circleHeight = constraints.maxHeight * 1.1;
          double imageWidth = constraints.maxWidth * 0.5;
          double imageHeight = constraints.maxHeight * 0.7;

          return Stack(
            children: [
              Container(
                color: Color(0xFF27569D).withOpacity(0.67),
              ),
              Positioned(
                top: constraints.maxHeight * 0.17,
                right: -constraints.maxWidth * 0.05,
                child: Container(
                  width: 192,
                  height: 202,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3365B0).withOpacity(0.67),
                  ),
                ),
              ),
              Positioned(
                top: -circleHeight * 0.4,
                left: -circleWidth * 0.3,
                child: Container(
                  width: circleWidth,
                  height: circleHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3365B0).withOpacity(0.67),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Mask group.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'College Link',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Spark your \n Learning journey',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
