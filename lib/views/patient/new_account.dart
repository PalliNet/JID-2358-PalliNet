import 'package:flutter/material.dart';
import 'package:pallinet/constants.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<NewAccountPage> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccountPage> {
  final List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>()];

  bool isPasswordVissible = false;

  String first = "";

  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create New Account",
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    }),
              onStepContinue: () {
                bool isLastStep = (currentStep == getSteps().length - 1);
                if (isLastStep) {
                  //Do something with this information
                } else {
                  setState(() {
                    if (_formKeys[currentStep].currentState?.validate() ?? false) {
                      currentStep += 1;
                    }
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              steps: getSteps(),
            )),
      ),
    );
  }

  List<Step> getSteps() {
    Widget gap() => const SizedBox(height: 10);

    return <Step>[
      Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Account Info"),
          content: Form(
            key: _formKeys[0],
            child: Column(
              children: [
                gap(),
                TextFormField(
                  validator: ((value) => emailValidation(value)),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap(),
                TextFormField(
                  validator: ((value) => passwordValidation(value)),
                  obscureText: !isPasswordVissible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVissible ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isPasswordVissible = !isPasswordVissible;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) => {first = value},
                ),
                gap(),
                TextFormField(
                  validator: ((value) => passwordVerification(value, first)),
                  obscureText: !isPasswordVissible,
                  decoration: InputDecoration(
                    labelText: 'Verify Password',
                    hintText: 'Verify your password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVissible ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isPasswordVissible = !isPasswordVissible;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Patient Details"),
        content: Column(
          children: [
            gap(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter your first name',
                border: OutlineInputBorder(),
              ),
            ),
            gap(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter your last names',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

emailValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  if (!emailValid) {
    return 'Please enter a valid email';
  }
  return null;
}

passwordValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

passwordVerification(value, first) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  debugPrint(value);
  debugPrint(first);
  if (value != first) {
    return "Password does not match";
  }
  return null;
}
