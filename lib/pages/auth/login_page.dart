import 'package:ecommerce_app_en/consts/validators.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/auth/google_button.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocus;
  late final FocusNode _passwordFocus;
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _loginFunc() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 25),
                      child: AppNameTextWidget(
                        title: "Best Shop",
                        fontSize: 35,
                      ),
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: TitleTextWidget(label: "Welcome Back")),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: SubtitleTextWidget(
                            label: "Log in and start exploring")),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: "Email address",
                                prefixIcon: Icon(Icons.email_outlined)),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocus);
                            },
                            validator: (value) {
                              return Validators.emailValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !isPasswordVisible,
                            focusNode: _passwordFocus,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    icon: isPasswordVisible
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                            onFieldSubmitted: (value) async {
                              return _loginFunc();
                            },
                            validator: (value) {
                              return Validators.passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const SubtitleTextWidget(
                                label: "Forgot Password?",
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const TitleTextWidget(label: "Login")),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SubtitleTextWidget(
                            label: "OR LOGIN USING",
                            fontWeight: FontWeight.w200,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(flex: 4, child: GoogleButton()),
                                const SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const SubtitleTextWidget(
                                          label: "Guest")),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          IntrinsicWidth(
                            child: InkWell(
                              onTap: () {},
                              child: RichText(
                                text: const TextSpan(
                                  text: 'You are new? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Register',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
