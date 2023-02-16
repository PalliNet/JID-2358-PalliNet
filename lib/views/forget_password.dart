import 'package:flutter/material.dart';
import 'package:pallinet/utils.dart';
import 'package:pallinet/firestore/auth.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Logo(),
                      FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: Logo()),
                        Expanded(
                          child: Center(child: FormContent()),
                        ),
                      ],
                    ),
                  )));
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  Widget gap() => const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Forgot Password",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
          ),
        ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
            "Enter in your email. If there is an account associated, we will send you an email to reset your password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14)
            ),
          ),
        gap(),
      ],
    );
  }
}

class FormContent extends StatefulWidget {
  const FormContent({Key? key}) : super(key: key);

  @override
  State<FormContent> createState() => FormContentState();
}

class FormContentState extends State<FormContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) => emailValidation(value),
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              onSaved: (newValue) => debugPrint(newValue),
            ),
            gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    debugPrint(email);
                    resetPassword({"email": email});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
