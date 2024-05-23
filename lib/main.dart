import 'package:flutter/material.dart';
// Assuming this is the correct import path for LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double circleWidth = constraints.maxWidth * 1;
            double circleHeight = constraints.maxHeight * 1.1;
            double imageWidth = constraints.maxWidth * 0.5;
            double imageHeight = constraints.maxHeight * 0.7;

            return Stack(
              children: [
                Container(
                  color: const Color(0xff27569D).withOpacity(0.67),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.17,
                  right: -constraints.maxWidth * 0.05,
                  child: Container(
                    width: 192,
                    height: 202,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff3365B0).withOpacity(0.67),
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
                      color: const Color(0xff3365B0).withOpacity(0.67),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Mask group.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    'College Link',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 20,
                  child: Text(
                    'Spark your \n Learning journey',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.07,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
