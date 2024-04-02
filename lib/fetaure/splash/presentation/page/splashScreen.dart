import 'package:baps_app/config/asset/constAsset.dart';
import 'package:baps_app/config/color/const_color.dart';
import 'package:baps_app/config/fontstyle/const_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Powered By ",style: ConstFontStyle().subtitleText.copyWith(
              color: ConstColor.greyTextColor
            ),),
            Text("Clonza Infotech",style: ConstFontStyle().subtitleText,),
          ],
        ),
      ),
      body: Center(
        child: SvgPicture.asset(ImageAsset.splashLogo),
      ),
    );
  }
}
