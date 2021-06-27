import 'package:crypto_ui/utils/utils.dart';
import 'package:crypto_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PasswordSetup extends StatefulWidget {
  const PasswordSetup({Key key}) : super(key: key);

  @override
  _PasswordSetupState createState() => _PasswordSetupState();
}

class _PasswordSetupState extends State<PasswordSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25.0,
              ),
              Input(
                type: TextInputType.visiblePassword,
                label: "Password",
                hint: "enter your password",
                isPassword: true,
                isPhone: false,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    validationMessage("Minimum of 8 characters", true),
                    validationMessage(
                        "Minimum of 1 Alphanumeric character", true),
                    validationMessage("Minimum of 1 uppercase letter", false),
                    validationMessage("Minimum of 1 number", false)
                  ],
                ),
              ),
              Input(
                type: TextInputType.visiblePassword,
                label: "Confirm password",
                hint: "confirm your password",
                isPassword: true,
                isPhone: false,
              ),
              const SizedBox(height: 20.0),
              Button(
                  iconFirst: false,
                  icon: Icon(Entypo.forward, color: Colors.white),
                  label: "Next",
                  color: Palette.mainColor,
                  pressCallback: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PasswordSetup())))
            ],
          ),
        ),
      ),
      bottomSheet: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 110.0,
        color: Palette.mainColor.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Do you have a referal code? ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Input(
                type: TextInputType.text,
                label: "Referal Code",
                hint: "enter your referal code",
                isPassword: false,
                isPhone: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget validationMessage(String message, bool validated) {
  return Row(
    children: [
      Icon(
        MaterialCommunityIcons.check_circle,
        color: validated ? Colors.green : Colors.indigoAccent,
      ),
      SizedBox(width: 8.0),
      Text(message,
          style: TextStyle(
            color: validated ? Colors.green : Colors.indigoAccent,
          ))
    ],
  );
}
