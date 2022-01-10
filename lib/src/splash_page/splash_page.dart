// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hive/gen/assets.gen.dart';
import 'package:flutter_hive/src/common/utils/config.dart';
import 'package:flutter_hive/src/home_page/home_page.dart';
import 'package:flutter_hive/src/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isLoggedIn = false;
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.green, // Color for Android
        statusBarIconBrightness: Brightness.light, //status barIcon Brightness
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    _checkIfLoggedIn();

    super.initState();
  }

  void _checkIfLoggedIn() {
    setState(() {
      _isLoggedIn = Config().isLoggedIn;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // fake loading 1.5 second

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (_isLoggedIn) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Assets.images.splashpage
                        .image(height: 400, width: 270, fit: BoxFit.cover)),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Splash Page',
                  style: TextStyle(
                    color: Colors.blueGrey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
