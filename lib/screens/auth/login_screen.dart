import 'package:ezmonitoring/screens/home_screen.dart';
import 'package:ezmonitoring/services/add_sector.dart';
import 'package:ezmonitoring/services/add_user.dart';
import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/button_widget.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:ezmonitoring/widgets/textfield_widget.dart';
import 'package:ezmonitoring/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              label: 'Email',
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
                if (selectedRole == 'Admin') {
                  if (username.text == 'admin_username' &&
                      password.text == 'admin_password') {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              type: 'Admin',
                            )));
                  } else {
                    showToast('Invalid admin credentials');
                  }
                } else {
                  login(context);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: selectedRole == 'Personnel',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Not yet registered?',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {
                      createDialog();
                    },
                    child: TextWidget(
                      text: 'Signup',
                      fontSize: 16,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController rfidController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  createDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create New Employee'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: fullnameController,
                  decoration: const InputDecoration(
                    labelText: 'Fullname',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: rfidController,
                  decoration: const InputDecoration(
                    labelText: 'RFID Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    labelText: 'Contact No.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: sectorController,
                  decoration: const InputDecoration(
                    labelText: 'Assigned Sector',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                register(context);
                // Handle saving the new employee's information here
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      addUser(
          fullnameController.text,
          contactController.text,
          rfidController.text,
          addressController.text,
          sectorController.text,
          emailController.text,
          'P');

      addSector(sectorController.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);
      Navigator.of(context).pop();

      showToast("Registered Successfully! You can now login");
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.of(context).pop();
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      print(e);
      showToast("An error occurred: $e");
    }
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text, password: password.text);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  type: selectedRole ?? 'Personnel',
                )),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
