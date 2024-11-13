import 'package:ezmonitoring/screens/home_screen.dart';
import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/button_widget.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:ezmonitoring/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  String? selectedRole; // This will hold the selected value

  bool inLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Login',
              fontSize: 18,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              height: 45,
              color: Colors.white,
              borderColor: Colors.white,
              label: 'Username',
              controller: username,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              height: 45,
              color: Colors.white,
              borderColor: Colors.white,
              label: 'Password',
              showEye: true,
              isObscure: true,
              controller: password,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 300,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  value: selectedRole,
                  hint: const Text('Select Role'),
                  items: [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: TextWidget(
                        text: 'Admin',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Personnel',
                      child: TextWidget(
                        text: 'Personnel',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              color: Colors.amber,
              width: 150,
              radius: 10,
              label: 'Login',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
