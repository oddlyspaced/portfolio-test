import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Map<String, String> icons = {
  "github":
      "https://raw.githubusercontent.com/oddlyspaced/portfolio-test/main/assets/icons/github.png",
  "playstore":
      "https://raw.githubusercontent.com/oddlyspaced/portfolio-test/main/assets/icons/playstore.png",
  "instagram":
      "https://raw.githubusercontent.com/oddlyspaced/portfolio-test/main/assets/icons/instagram.png",
  "link":
      "https://raw.githubusercontent.com/oddlyspaced/portfolio-test/main/assets/icons/link.png",
  "medium":
      "https://raw.githubusercontent.com/oddlyspaced/portfolio-test/main/assets/icons/medium.png"
};

int active = 2;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                        Spacer(),
                        PageSwitcher(
                          titles: ["projects", "articles"],
                          onUpdate: () {
                            setState(() {
                              print(active);
                            });
                          },
                        ),
                        Spacer(),
                        TopNavbar(
                          items: [
                            "GitHub",
                            "Instagram",
                          ],
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
                  child: (active == 1) ? ProjectsSection() : ArticlesSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProjectItem(
              technology: "KOTLIN / ANDROID",
              name: "Burner Bits (Client)",
              desc:
                  "News App created to present content in Quick and Easy to read format. Provides Image focused and features all rounded features like customisable User Feed, Offline Post Saving, Native Dark Mode, Grayscale Reading Mode and much more",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
            ),
            ProjectItem(
              technology: "KOTLIN / ANDROID",
              name: "Guard",
              desc:
                  "Privacy centric Android App which lets the user know about Apps which are having to excessive and critical permissions. Provides a Privacy Indicator which shows a dot on screen whenever the device's Camera and/or Mic is being used. Also has features like Cache Cleaner, Bulk Uninstall and Permission Logger",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
            ),
            ProjectItem(
                technology: "KOTLIN / ANDROID",
                name: "Covid 19 - Android",
                desc:
                    "Unofficial Android App based on @covid19india's and @novelCOVID's api which visualises stats beautifully using graphs and tables."),
          ],
        ),
      ),
    );
  }
}

class ArticlesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ArticleItem(
              name: "Diving into Android’s Wallpaper crash bug",
              desc:
              "Detailed article explaining about the bug in Android’s SystemUI which started crashing infinitely on applying a specific wallpaper.",
              date: "JUN. 3, 2020",
            ),
            ArticleItem(
              name: "Compiling Aarogya Setu from source",
              desc:
              "An article on as to how one can compile the publicly available Aarogya Setu source code into a functioning apk. Also gives a basic primer on reverse engineering apk files.",
              date: "JUN. 10, 2020",
            ),
          ],
        ),
      ),
    );
  }
}

class PageSwitcher extends StatelessWidget {
  final List<String> titles;
  final Function onUpdate;

  const PageSwitcher({this.titles, this.onUpdate}) : super();

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Column(
      children: titles.map((elem) {
        counter++;
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
          ),
          child: GestureDetector(
            onTap: () {
              active = titles.indexOf(elem) + 1;
              onUpdate();
            },
            child: PageItem(
              isActive: counter == active,
              title: elem.toUpperCase(),
              counter: (counter.toString().length == 1)
                  ? "0" + (counter).toString()
                  : (counter).toString(),
            ),
          ),
        );
      }).toList(),
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
                color: (isActive) ? Colors.white : Color(0xFF626262),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Container(
            height: 2,
            width: (isActive) ? 96 : 64,
            color: (isActive) ? Colors.white : Color(0xFF626262),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: (isActive) ? Colors.white : Color(0xFF626262),
              letterSpacing: 4,
              fontSize: 16,
              fontWeight: FontWeight.w700,
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
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                technology,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4,
                ),
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
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              Text(
                desc,
                softWrap: true,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFFa1a1a1),
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.network(
                        icons['playstore'],
                        color: Colors.white,
                        height: 18,
                        width: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                      ),
                      Text(
                        "Google Play",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                    ),
                  ),
                  Row(
                    children: [
                      Image.network(
                        icons['github'],
                        color: Colors.white,
                        height: 18,
                        width: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                      ),
                      Text(
                        "Github",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final String icon;
  final String name;
  final String desc;
  final String date;

  const ArticleItem({this.icon, this.name, this.desc, this.date}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
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
        child: Expanded(
          flex: 20,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(52),
                      child: Image.network(
                        icons['medium'],
                        color: Color(0xFFa1a1a1),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF202022), shape: BoxShape.circle),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                ),
              ),
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                    ),
                    Text(
                      desc,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFFa1a1a1),
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 4,
                        fontSize: 16,
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
    return Row(
      children: items
          .map(
            (elem) => Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: Row(
                children: [
                  Image.network(
                    icons[elem.toLowerCase()],
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                  ),
                  Text(
                    elem,
                    style: TextStyle(
                      color: Color(0xFFe8e6e3),
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                  ),
                  Image.network(
                    icons['link'],
                    color: Colors.white,
                    height: 16,
                    width: 16,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
