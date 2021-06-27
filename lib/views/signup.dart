import 'package:crypto_ui/utils/utils.dart';
import 'package:crypto_ui/views/views.dart';
import 'package:crypto_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String sex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Input(
                type: TextInputType.text,
                label: "Username",
                hint: "enter your username",
                isPassword: false,
                isPhone: false,
                context: context,
              ),
              Input(
                type: TextInputType.text,
                label: "Email",
                hint: "enter your email",
                isPassword: false,
                isPhone: false,
                context: context,
              ),
              Input(
                type: TextInputType.text,
                label: "Number",
                hint: "enter your phone number",
                isPassword: false,
                isPhone: true,
                context: context,
              ),
              ToggleSwitch(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                initialLabelIndex: 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey.shade200,
                inactiveFgColor: Colors.indigoAccent,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                icons: [FontAwesome.mars, FontAwesome.venus],
                activeBgColors: [
                  [Palette.mainColor],
                  [Palette.secondaryColor]
                ],
                onToggle: (index) {
                  // index == 1
                  //     ? setState(() => sex = "male")
                  //     : setState(() => sex = "female");
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                        iconFirst: true,
                        icon: Icon(Ionicons.logo_google,
                            color: Colors.indigoAccent),
                        label: "SignUp with Google",
                        color: Colors.redAccent.shade200),
                    Button(
                        iconFirst: true,
                        icon: Icon(AntDesign.apple_o, color: Colors.grey),
                        label: "SignUp with Apple",
                        color: Colors.black87)
                  ],
                ),
              ),
              // OutlinedButton(
              //     onPressed: () => print("moved"),
              //     child: Text("Already have an account ? Login There!")),
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
      bottomSheet: Container(
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
