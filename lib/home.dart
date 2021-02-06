import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BackDrop(
                text: "hello",
                size: 320,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Hardik Srivastava",
                    style: TextStyle(
                      color: Color(0xFFe8e6e3),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 4,
                      fontSize: 128,
                    ),
                  ),
                  Text(
                    "App Developer",
                    style: TextStyle(
                      color: Color(0xFFaeacaa),
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackDrop extends StatelessWidget {
  final text;
  final size;
  var strokeWidth;

  BackDrop({
    @required this.text, @required this.size, this.strokeWidth,
  }): super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Color(0xFF0c0c0c),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
