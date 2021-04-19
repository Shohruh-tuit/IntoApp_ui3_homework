import 'package:flutter/material.dart';
import 'package:pdp_ui3_intro_homework/pages/home_page.dart';
import 'package:pdp_ui3_intro_homework/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // *****************************************************
  // Slider Page uchun Controller

  PageController _pageController;
  // PageController _pageController = new PageController(); bilan teng kuchga ega

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // *******************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(
                () {
                  currentIndex = page;
                },
              );
            },
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                skipp: _skipped(),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),

          // # Skip
          // _skipped(currentIndex == 2),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, skipp}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              // SizedBox(height: 200),
              Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    child: skipp,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 6,
          width: isActive ? 30 : 6,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(
          _indicator(true),
        );
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _skipped() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  // IntroPage olib tashlaydi umuman orqaga qaytib bo'lmaydi
                  context,
                  HomePage.id);
            },
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
