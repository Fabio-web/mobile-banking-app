import 'package:flutter/cupertino.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CatchPhrase extends StatelessWidget {

  final hangs = [
    'Creating financial opportunities for everyone',
    'Get powerfully best business platform'
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: PageView(
                controller: _pageController,
                children: hangs.map((e) =>
                    Text(e,
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.left,
                    )
                ).toList(),
              ),
            ),
            Container(
              height: 100,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: hangs.length,
                effect: const JumpingDotEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 10,
                    activeDotColor: kPrimaryColor
                ),
                onDotClicked: (index) => _pageController.jumpToPage(index),
              ),
            ),
        ]
      ),
    );
  }
}
