import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medicineapp/cost/global_key.dart';
import 'package:medicineapp/view/basic_details.dart';
import 'package:medicineapp/view/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKeys.generateFormKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();

  bool _isSelected = false;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Padding(
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
                      height: height * 0.13,
                    ),
                    const Text(
                      'Register',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    const Text(
                      'Full name',
                      style: TextStyle(color: Colors.black),
                    ),
                    CustomTextField(
                      contentPadding: height * 0.01,
                      hintText: '',
                      borderColor: Colors.black,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'FullName cannot be empty';
                        }
                        return null;
                      },
                      controller: fullnameController,
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
                      obscureText: isObscure,
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: Row(
                        children: <Widget>[
                          Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                                print(_isSelected);
                              },
                              child: Row(
                                children: <Widget>[
                                  _isSelected
                                      ? const CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 8,
                                          child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  Colors.black45),
                                        )
                                      : const CircleAvatar(
                                          radius: 8,
                                          backgroundColor: Colors.grey,
                                        ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'I agree with the Terms of Service & Privacy Policy',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text: ' Already Member? ',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => SignInPage(),
                                      ));
                                    }),
                            ],
                          ),
                        ),
                        const Spacer(),
                        OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _isSelected == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.black,
                                    content: Text('Form is valid!')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.black,
                                    content: Text('Please fix the errors!')),
                              );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                            minimumSize: Size(width * 0.4, height * 0.04),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(color: Colors.white),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
