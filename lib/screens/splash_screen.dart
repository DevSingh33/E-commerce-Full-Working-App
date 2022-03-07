import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/components/splash_content_page.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashPagesData = [
    {
      'text': 'Welcome to TOKOTO, Let\'s shop!',
      'image': 'assets/images/splash_1.png',
    },
    {
      'text': 'We help people connect to stores around them',
      'image': 'assets/images/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop. \nJust Stay at home with us',
      'image': 'assets/images/splash_3.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashPagesData.length,
                itemBuilder: (ctx, index) => SplashContentPage(
                  text: splashPagesData[index]['text']!,
                  image: splashPagesData[index]['image']!,
                ),
                onPageChanged: (pageIndex) {
                  setState(() {
                    currentPage = pageIndex;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashPagesData.length,
                      ((index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 6),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          )),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DefaultButton(
                      onPress: () {},
                      buttonText: 'Continue',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
