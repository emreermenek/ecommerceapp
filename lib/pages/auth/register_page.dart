import 'package:ecommerce_app_en/consts/validators.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/auth/google_button.dart';
import 'package:ecommerce_app_en/widgets/auth/image_picker_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/app_functions.dart';

class RegisterPage extends StatefulWidget {
  static const String rootName = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  late final TextEditingController _nameController,
      _emailController,
      _passwordController,
      _rePasswordController;

  late final FocusNode _nameFocus,
      _emailFocus,
      _passwordFocus,
      _rePasswordFocus;

  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();

    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _rePasswordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _rePasswordFocus.dispose();
    super.dispose();
  }

  Future<void> _registerFunc() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
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
                    const AppNameTextWidget(
                      title: "Best Shop",
                      fontSize: 35,
                    ),
                    const SizedBox(
                      height: 25,
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
                            label: "Sign up and start exploring")),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: size.width * 0.3,
                        width: size.width * 0.3,
                        child: ImagePickerWidget(
                          pickedImage: _pickedImage,
                          func: () async {
                            AppFunctions.imagePickerDialog(
                                context: context,
                                cameraFunc: () {},
                                galleryFunc: () {},
                                removeFunc: () {});
                          },
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Icon(Icons.person)),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_emailFocus);
                            },
                            validator: (value) {
                              return Validators.displayNameValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                            textInputAction: TextInputAction.next,
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
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_rePasswordFocus);
                            },
                            validator: (value) {
                              return Validators.passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _rePasswordController,
                            focusNode: _rePasswordFocus,
                            obscureText: !isPasswordVisible,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Repeat Password",
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onFieldSubmitted: (value) async {
                              return _registerFunc();
                            },
                            validator: (value) {
                              return Validators.repeatPasswordValidator(
                                  value, _passwordController.text);
                            },
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  return _registerFunc();
                                },
                                child: const TitleTextWidget(label: "Sign up")),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
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
