
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xiaomiease/screens/sigin_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../env/dimensions.dart';
import '../../shared_widgets/custom_btn.dart';
import '../../shared_widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Xiaomiease'),
          backgroundColor: Colors.amber[900],
           actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });

            },
            child: const Text('Log Out'),
          ),
           ]
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/invoice_logo.svg",
              height: Dimensions.calcH(120),
              color: Colors.black,
            ),
            SizedBox(
              height: Dimensions.calcH(15),
            ),
            CustomText(
              text: AppStrings.APP_NAME,
              color: Colors.black,
              weight: FontWeight.bold,
              fontSize: Dimensions.calcH(25),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomText(
              text: AppStrings.APP_DESC,
              color: Colors.black,
              weight: FontWeight.w600,
              height: 1.3,
              fontSize: Dimensions.calcH(18),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomBtn(
              label: AppStrings.START_BTN,
              action: () {
                Get.offAndToNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
