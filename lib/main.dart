import 'package:crypto_ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ejara',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.indigo,
        ),
        home: Home());
  }
}

// ignore: slash_for_doc_comments
/** 
 * To be replaced by the original home screen
 */
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejara"),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                  height: 200.0,
                  color: Colors.indigoAccent.shade200,
                  child: Center(child: Text("Ejara"))),
              drawerItem(context,
                  icon: Icon(AntDesign.adduser),
                  text: "Signup",
                  destionation: SignUp()),
              drawerItem(context,
                  icon: Icon(AntDesign.lock),
                  text: "Password Setup",
                  destionation: PasswordSetup()),
              drawerItem(context,
                  icon: Icon(MaterialCommunityIcons.incognito),
                  text: "Secret words",
                  destionation: SecretWords()),
              drawerItem(context,
                  icon: Icon(MaterialCommunityIcons.piano),
                  text: "Pin Code",
                  destionation: Unlock()),
            ],
          ),
        ),
        body: Center(child: Icon(Entypo.$500px)));
  }
}

Widget drawerItem(context, {Icon icon, String text, Widget destionation}) {
  return ListTile(
      title: Text(text),
      leading: icon,
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destionation),
          ));
}
