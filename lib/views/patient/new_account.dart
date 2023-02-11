import 'package:flutter/material.dart';
import 'package:pallinet/constants.dart';

final PageController controller = PageController();

class NewAccount extends StatelessWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: PageView(scrollDirection: Axis.vertical, controller: controller, children: [
        Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Logo(),
            AccountPage(),
          ],
        )),
        Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            DetailPage(),
          ],
        )),
      ]),
    );
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
            "Create New Account",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
          ),
        ),
        gap(),
      ],
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  bool isPosswordVisible = false;
  String first = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                return null;
              },
              obscureText: !isPosswordVisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(isPosswordVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isPosswordVisible = !isPosswordVisible;
                      });
                    },
                  )),
              onChanged: (value) => {first = value},
            ),
            gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (value != first) {
                  return 'Password does not match';
                }
                return null;
              },
              obscureText: !isPosswordVisible,
              decoration: InputDecoration(
                  labelText: 'Verify Password',
                  hintText: 'Verify Password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(isPosswordVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isPosswordVisible = !isPosswordVisible;
                      });
                    },
                  )),
            ),
            gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  // if (formKey.currentState?.validate() ?? false) {
                  //   debugPrint("Validateed");
                  //   // Create new account and insert data into database
                  // }
                  controller.nextPage(duration: const Duration(seconds: 1), curve: const Interval(0.3, 0.7));
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

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  bool isPosswordVisible = false;
  String first = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Patient Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            gap(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
                hintText: 'OwO',
              ),
            ),
            gap(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last Name',
                hintText: 'OwO',
              ),
            ),
            gap(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField(
                    items: Gender.values.map((e) {
                      return DropdownMenuItem<Gender>(
                        value: e,
                        child: Text(e.value),
                      );
                    }).toList(),
                    hint: const Text("Gender"),
                    onChanged: (value) => {},
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Birthdate',
                      hintText: '01/01/1900',
                    ),
                  ),
                ),
              ],
            ),
            gap(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
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
                  flex: 4,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'xxx-xxx-xxxx',
                    ),
                  ),
                ),
              ],
            ),
            gap(),
            gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  controller.nextPage(duration: const Duration(seconds: 1), curve: const Interval(0.3, 0.7));
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
