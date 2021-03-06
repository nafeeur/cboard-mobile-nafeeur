import 'package:cboard_mobile/UI/onboarding/screens/log-in.dart';
import 'package:cboard_mobile/UI/onboarding/screens/sign-up--main.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/header.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Welcome'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
            child: Header(),
            margin: EdgeInsets.only(bottom: 50),
          ),
          Container(
            child: Placeholder(
              fallbackHeight: 60,
            ),
            margin: EdgeInsets.only(bottom: 20),
          ),
          Placeholder(
            fallbackHeight: 60,
          ),
          Expanded(
            child: ButtonBar(
              children: [
                Button(
                  label: Text('LOG IN'),
                  isPrimary: false,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                ),
                Button(
                  label: Text('SIGN UP'),
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpMain()),
                    );
                  },
                ),
              ],
              alignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}
