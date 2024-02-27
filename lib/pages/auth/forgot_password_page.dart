import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:flutter/material.dart';

import '../../consts/validators.dart';
import '../../widgets/subtitle_text.dart';
import '../../widgets/title_text.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String rootName = "/forgot_password";
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;

  late FocusNode _emailFocus;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();

    _emailFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    _emailFocus.dispose();
    super.dispose();
  }

  Future<void> _forgotPasswordFunc() async {
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
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        ImagesManager.forgotPassword,
                        height: size.width * 0.4,
                        width: size.width * 0.4,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: TitleTextWidget(label: "Forgot Password")),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: SubtitleTextWidget(
                            label: "Enter your email to reset your password")),
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
                              _forgotPasswordFunc();
                              Focus.of(context).unfocus();
                            },
                            validator: (value) {
                              return Validators.emailValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  return _forgotPasswordFunc();
                                },
                                child: const TitleTextWidget(
                                    label: "Request Link")),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
