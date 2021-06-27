import 'package:country_code_picker/country_code_picker.dart';
import 'package:crypto_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Input extends StatefulWidget {
  final BuildContext context;
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isPassword;
  final bool isPhone;
  final TextInputType type;

  const Input(
      {Key key,
      this.context,
      this.controller,
      this.label,
      this.hint,
      this.isPassword,
      this.type,
      this.isPhone})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = true;
  bool iconChanged = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(
          color: Palette.mainColor,
          fontWeight: FontWeight.w400,
        ),
        onTap: () {
          Navigator.canPop(widget.context);
        },
        keyboardType: widget.type,
        obscureText: widget.isPassword && obscure ? true : false,
        decoration: InputDecoration(
            prefixIcon: widget.isPhone
                ? CountryCodePicker(
                    onChanged: print,
                    favorite: ['+237', '+234'],
                    initialSelection: '+237',
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  )
                : null,
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Palette.mainColor),
            ),
            contentPadding: const EdgeInsets.only(left: 12.0),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: iconChanged
                        ? Icon(Entypo.eye_with_line)
                        : Icon(Entypo.eye),
                    onPressed: () {
                      setState(() {
                        iconChanged = !iconChanged;
                        obscure = !obscure;
                      });
                    })
                : null,
            labelText: widget.label),
      ),
    );
  }
}
