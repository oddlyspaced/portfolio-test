import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     "oddlyspaced",
              //     style: TextStyle(
              //       fontStyle: FontStyle.italic,
              //       color: Color(0xFFe8e6e3),
              //
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.topRight,
                child: TopNavbar(
                  items: [
                    "academics",
                    "skills",
                    "experience",
                    "contact",
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: BackDrop(
                  text: "hello",
                  size: 320,
                  strokeWidth: 8,
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
      ),
    );
  }
}

class BackDrop extends StatelessWidget {
  final text;
  final size;
  final strokeWidth;

  BackDrop({
    @required this.text, @required this.size, @required this.strokeWidth,
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
              ..strokeWidth = strokeWidth
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


class TopNavbar extends StatelessWidget {
  final List<String> items;
  const TopNavbar({this.items}) : super();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.map((elem) => Padding(
        padding: const EdgeInsets.only(
          left: 16, right: 16,

        ),
        child: Text(
          elem,
          style: TextStyle(
            color: Color(0xFFe8e6e3),
            fontSize: 24,
          ),
        ),
      )).toList(),
    );
  }
}
