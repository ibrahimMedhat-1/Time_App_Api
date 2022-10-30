import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final userNameCont = TextEditingController();
  final passWordCont = TextEditingController();
  check() async {
    final username = await SharedPreferences.getInstance();
    final password = await SharedPreferences.getInstance();
    String? userName = username.getString('username');
    String? Password = password.getString('password');

    if (userName == null && Password == null) {
      print('object');
    } else {
      print(userName);
      Navigator.pushNamed(context, '/locations.dart');
    }
  }

  @override
  Widget build(BuildContext context) {
    check();
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text('Log In'),
            TextField(
              controller: userNameCont,
            ),
            const Text('Password'),
            TextField(
              controller: passWordCont,
            ),
            ElevatedButton(
                onPressed: () async {
                  final username = await SharedPreferences.getInstance();
                  final password = await SharedPreferences.getInstance();
                  username.setString('username', userNameCont.text);
                  password.setString('password', passWordCont.text);
                  String? userName = username.getString('username');
                  String? Password = password.getString('password');
                  if (userName == '' && Password == '') {
                    print(userNameCont.text);
                    print('mesh haroo7');
                  } else {
                    print(userNameCont.text);
                    Navigator.pushNamed(context, '/locations.dart');
                  }
                  // Navigator.pushReplacementNamed(context, '/locations.dart');
                },
                child: const Text('log in')),
          ],
        ),
      ),
    );
  }
}
