import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_sun3/auth/custom_text_form_field.dart';
import 'package:flutter_app_todo_c10_sun3/auth/register/register_screen.dart';
import 'package:flutter_app_todo_c10_sun3/dialog_utils.dart';
import 'package:flutter_app_todo_c10_sun3/home/home_screen.dart';
import 'package:flutter_app_todo_c10_sun3/my_theme.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'amira@route.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.backgroundLightColor,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Login'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Welcome Back!',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Email';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please enter valid email';
                          }
                          return null; // valid
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Password';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 chars.';
                          }
                          return null; // valid
                        },
                        controller: passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.titleLarge,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
                            child: Text(
                              'OR Create Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: MyTheme.primaryColor),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      /// login
      // todo: show loading
      DialogUtils.showLoading(
          context: context, message: 'Loading...', isDismissible: false);
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        // todo: hide loading
        DialogUtils.hideLoading(context);
        // todo: show Message
        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully.',
            title: 'Success',
            posActionName: 'Ok',
            posAction: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            });
        print('login successfully');
        print(credential.user?.uid ?? "");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          // todo: hide loading
          DialogUtils.hideLoading(context);
          // todo: show Message
          DialogUtils.showMessage(
            context: context,
            message:
                'The supplied auth credential is incorrect, malformed or has expired.',
            title: 'Error',
            posActionName: 'Ok',
          );
          print(
              'The supplied auth credential is incorrect, malformed or has expired.');
        }
      } catch (e) {
        // todo: hide loading
        DialogUtils.hideLoading(context);
        // todo: show Message
        DialogUtils.showMessage(
          context: context,
          message: '${e.toString()}',
          title: 'Error',
          posActionName: 'Ok',
        );
        print(e.toString());
      }
    }
  }
}
