import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pallinet/constants.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<NewAccountPage> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccountPage> {
  final List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

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
                  debugPrint("OwO");
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
          content: Form(
            key: _formKeys[1],
            child: Column(
              children: [
                gap(),
                TextFormField(
                  validator: (value) => requiredValue(value),
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap(),
                TextFormField(
                  validator: (value) => requiredValue(value),
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 3,
                        child: DropdownButtonFormField(
                          validator: (value) => requiredValue(value),
                          items: Gender.values.map((e) {
                            return DropdownMenuItem<Gender>(
                              value: e,
                              child: Text(e.value),
                            );
                          }).toList(),
                          hint: const Text("Gender"),
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                          ),
                          onChanged: (value) => {},
                        )),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                          validator: (value) => requiredValue(value),
                          decoration: const InputDecoration(
                            labelText: 'Birthdate',
                            hintText: 'Enter your birthdate',
                            // border: OutlineInputBorder(),
                          ),
                          inputFormatters: [DateTextFormatter()],
                          keyboardType: const TextInputType.numberWithOptions(),
                        )),
                  ],
                )
              ],
            ),
          )),
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Additional Contact Information"),
          content: Form(
            key: _formKeys[2],
            child: Column(
              children: [
                gap(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField(
                        items: NumberType.values.map((e) {
                          return DropdownMenuItem<NumberType>(
                            value: e,
                            child: Text(e.value),
                          );
                        }).toList(),
                        hint: const Text("Type"),
                        onChanged: (value) => {},
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'xxx-xxx-xxxx',
                          ),
                          inputFormatters: [PhoneNumberFormatter()],
                          keyboardType: const TextInputType.numberWithOptions(),
                        )),
                    // TODO ability to add multiple contactss
                  ],
                )
              ],
            ),
          )),
    ];
  }
}

emailValidation(value) {
  // if (value == null || value.isEmpty) {
  //   return 'Please enter some text';
  // }
  // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  // if (!emailValid) {
  //   return 'Please enter a valid email';
  // }
  return null;
}

passwordValidation(value) {
  // if (value == null || value.isEmpty) {
  //   return 'Please enter some text';
  // }
  // if (value.length < 6) {
  //   return 'Password must be at least 6 characters';
  // }
  return null;
}

passwordVerification(value, first) {
  // if (value == null || value.isEmpty) {
  //   return 'Please enter some text';
  // }
  // if (value != first) {
  //   return "Password does not match";
  // }
  return null;
}

requiredValue(value) {
  if (value.runtimeType == Gender) {
    return null;
  } else if (value.runtimeType == null || value.isEmpty) {
    return 'Required field';
  }
  return null;
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String separator = '/';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String separator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  static const _maxChars = 10;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String separator = '-';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String separator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 2 || i == 5) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}
