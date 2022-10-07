import 'package:flutter/material.dart';
import 'home_screen.dart';

const Color colors = Color.fromARGB(
  255,
  108,
  56,
  125,
);

class OnboardingScreen extends StatelessWidget {
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 8),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome back (:',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter password to continue',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  SizedBox(height: 75),
                  input('User Name', false, name),
                  SizedBox(height: 16),
                  input('Enter your Password', true),
                  SizedBox(height: 16),
                  fingerprint(context),
                  SizedBox(height: 16),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(name: name.text)));
                    },
                    color: colors,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        child: Text('Sign up', style: TextStyle(color: colors)),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextField input(String text, bool obscure,
        [TextEditingController? controller]) =>
    TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
          label: Text(text),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.2,
          ))),
    );

SizedBox fingerprint(BuildContext context) => SizedBox(
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('OR'),
        Icon(Icons.fingerprint, size: 60, color: colors),
        Text('Login using Fingerprint')
      ],
    ));
