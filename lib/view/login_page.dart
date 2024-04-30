import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicineapp/cost/global_key.dart';
import 'package:medicineapp/view/basic_details.dart';
import 'package:medicineapp/view/signup_page.dart';


class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
    final GlobalKey<FormState> _formKey = GlobalKeys.generateFormKey();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    const Center(
                      child: Text(
                        'NOTRE PHARMACY',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.16,
                    ),
                    const Text(
                      'Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(color: Colors.black),
                    ),
                    CustomTextField(
                      contentPadding: height * 0.01,
                      hintText: '',
                      borderColor: Colors.black,
                      validator: (value) {
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value!)) {
                          return "Email is invalid";
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(color: Colors.black),
                    ),
                    Column(
                      children: [
                        CustomTextField(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: isObscure
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          contentPadding: height * 0.01,
                          hintText: '',
                          borderColor: Colors.black,
                          validator: (value) {
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+}{:;"?><,./\|]).{8,}$')
                                .hasMatch(passwordController.text)) {
                              return "Password is invalid";
                            }
                            return null;
                          },
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          children: [
                            Spacer(),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.13,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/google_icon.jpg"),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'New Here? ',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: 'Register',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage(),
                                        ));
                                      }),
                              ],
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Form is valid!')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please fix the errors!')),
                                );
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              minimumSize: Size(width * 0.45, height * 0.04),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
