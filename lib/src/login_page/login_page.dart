import 'package:flutter/material.dart';
import 'package:flutter_hive/src/common/utils/config.dart';
import 'package:flutter_hive/src/home_page/home_page.dart';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  static const routeName = 'login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;
  late TextEditingController _controllerPassword;
  bool _isLoggedIn = false;
  bool _disable = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget judulLogin() {
      return const Text(
        'Form Login',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      );
    }

    Widget loginForm() {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
              controller: _controllerPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonLogin() {
      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // await clearLoginInfo();
                  await Config.set('isLoggedIn', true);
                  await Config.set('email', _controller.text);
                  await Config.set('password', _controllerPassword.text);
                  // Navigator.of(context, rootNavigator: false).pushAndRemoveUntil(
                  //   MaterialPageRoute(builder: (context) {
                  //     return const LoginPage();
                  //   }),
                  //   (_) => false,
                  // );

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomePage.routeName, (route) => false);
                }
              },

              child: const Text('Login'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
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
                // await Config.set('isLoggedIn', true);
                // logger.d('wowo ${Config.configContainer.isEmpty}');
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
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white))),
              // color: Colors.blue,
              // textColor: Colors.white,
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
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              judulLogin(),
              loginForm(),
              buttonLogin(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
