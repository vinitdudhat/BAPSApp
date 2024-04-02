import 'package:baps_app/config/asset/constAsset.dart';
import 'package:baps_app/config/fontstyle/const_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/color/const_color.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController? pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: deviceHeight * 0.1),
            child: Container(
              height: deviceHeight * 0.4,
              // color : Colors.red,
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (int index) {
                    print(index);
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (BuildContext context, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: deviceHeight * 0.2,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                currentIndex == 0
                                    ? SvgPicture.asset(ImageAsset.intro1)
                                    : currentIndex == 1
                                        ? SvgPicture.asset(ImageAsset.intro2)
                                        : SvgPicture.asset(ImageAsset.intro2),
                              ],
                            )),
                        SizedBox(height: deviceHeight * 0.05),
                        Text(
                          "Event Management",
                          textAlign: TextAlign.center,
                          style: ConstFontStyle().titleText,
                        ),

                        Text(
                          "This productive tool is designed to help you better manage your event project-wise conveniently!",
                          textAlign: TextAlign.center,
                          style: ConstFontStyle().mediumText,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.00,
                right: deviceWidth * 0.07,
                left: deviceWidth * 0.07),
            child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when unknown printer took a galley type and scrambled it to make type specimen.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.03, bottom: deviceHeight * 0.02),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => buildDot(index)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.01,
                right: deviceWidth * 0.01,
                left: deviceWidth * 0.04,
                bottom: deviceHeight * 0.01),
            child: GestureDetector(
              onTap: () async {
                print(currentIndex);
                if (currentIndex == 2) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("isFirstTime", false);
                  // Get.offAll(()=>SignupScreen());
                } else {
                  pageController!.nextPage(
                      duration: Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                }
              },
              child: Container(
                width: deviceWidth * 0.90,
                height: deviceHeight * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.09),
                  color: ConstColor.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 14,
                        color: ConstColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.01,
                right: deviceWidth * 0.01,
                left: deviceWidth * 0.04,
                bottom: deviceHeight * 0.01),
            child: GestureDetector(
              onTap: () async {
                // Get.offAll(()=>SignupScreen());
              },
              child: Container(
                width: deviceWidth * 0.90,
                height: deviceHeight * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.09),
                  color: ConstColor.white,
                ),
                child: const Center(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 8,
      width: currentIndex == index ? 36 : 8,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstColor.primaryColor),
    );
  }
}
