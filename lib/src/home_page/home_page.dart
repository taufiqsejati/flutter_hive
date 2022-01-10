import 'package:flutter/material.dart';
import 'package:flutter_hive/gen/assets.gen.dart';
import 'package:flutter_hive/src/common/utils/config.dart';
import 'package:flutter_hive/src/login_page/login_page.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  bool _disable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              Center(
                  child: Assets.images.bgSplashpage
                      .image(height: 400, width: 270, fit: BoxFit.cover)),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Home Page',
                style: TextStyle(
                  color: Colors.blueGrey[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text('Status Login :'),
                  const SizedBox(
                    width: 10,
                  ),
                  _disable
                      ? const SizedBox()
                      : Text(
                          _isLoggedIn ? 'True' : 'false',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ],
              ),
              Row(
                children: [
                  const Text('email :'),
                  const SizedBox(
                    width: 10,
                  ),
                  _disable
                      ? const SizedBox()
                      : Text(
                          Config.configContainer.get('email'),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ],
              ),
              Row(
                children: [
                  const Text('password :'),
                  const SizedBox(
                    width: 10,
                  ),
                  _disable
                      ? const SizedBox()
                      : Text(
                          Config.configContainer.get('password'),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // await clearLoginInfo();
                    // await Config.set('isLoggedIn', true);
                    // Config().isLoggedIn;
                    // logger.d('wowo ${Config().isLoggedIn}');
                    if (Config().isLoggedIn) {
                      setState(() {
                        _disable = false;
                        _isLoggedIn = Config().isLoggedIn;
                      });
                    } else {
                      setState(() {
                        _disable = false;
                        _isLoggedIn = Config().isLoggedIn;
                      });
                    }
                  },

                  child: const Text('GET'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white))),
                  // color: Colors.blue,
                  // textColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // await clearLoginInfo();
                    Config.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.routeName, (route) => false);
                    // await Config.set('isLoggedIn', true);
                  },

                  child: const Text('Logout'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white))),
                  // color: Colors.blue,
                  // textColor: Colors.white,
                ),
              ),
            ]),
      )),
    );
  }
}
