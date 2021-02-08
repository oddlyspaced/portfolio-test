import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.08,
            MediaQuery.of(context).size.height * 0.08,
            MediaQuery.of(context).size.width * 0.08,
            MediaQuery.of(context).size.height * 0.08,
          ),
          child: Flexible(
            flex: 10,
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 32,
                          ),
                        ),
                        SubHeader(),
                        PageItem(
                          isActive: true,
                          title: "PROJECTS",
                          counter: "01",
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProjectItem(
                            technology: "KOTLIN",
                            name: "Burner Bits 2.0",
                            desc: "news app",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 12,
                            ),
                          ),
                          ProjectItem(
                            technology: "KOTLIN",
                            name: "Burner Bits 2.0",
                            desc: "news app",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final String counter;
  final String title;
  final bool isActive;

  const PageItem({this.counter, this.title, this.isActive}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            counter,
            style: TextStyle(
              color: (isActive)? Colors.white: Color(0xFF626262),
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Container(
            height: 2,
            width: (isActive)? 96: 64,
            color: (isActive)? Colors.white: Color(0xFF626262),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: (isActive)? Colors.white: Color(0xFF626262),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello, I'm\nHardik Srivastava",
      style: TextStyle(
          color: Color(0xFFFFFFFF), fontSize: 80, fontWeight: FontWeight.bold),
    );
  }
}

class SubHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Cross Platform and Native Android App Developer working as Tech Lead and App Dev head at BurnerMedia. I mostly do Native Android App Development and I'm a Linux fanatic.",
      style: TextStyle(
        color: Color(0xFFa1a1a1),
        fontSize: 18,
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String technology;
  final String name;
  final String desc;

  const ProjectItem({this.technology, this.name, this.desc}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF202022),
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.02,
          MediaQuery.of(context).size.height * 0.04,
          MediaQuery.of(context).size.width * 0.02,
          MediaQuery.of(context).size.height * 0.04,
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.vertical,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              technology,
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                color: Color(0xFFa1a1a1),
                fontSize: 16,
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
  final strokeWidth;

  BackDrop({
    @required this.text,
    @required this.size,
    @required this.strokeWidth,
  }) : super();

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
      children: items
          .map((elem) => Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  elem,
                  style: TextStyle(
                    color: Color(0xFFe8e6e3),
                    fontSize: 24,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
