import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final String label;
  final Color color;
  final bool iconFirst;
  final Function pressCallback;
  const Button(
      {Key key,
      this.icon,
      this.label,
      this.color,
      this.iconFirst,
      this.pressCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressCallback,
      child: AnimatedContainer(
        height: 40.0,
        width: 160.0,
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconFirst ? icon : SizedBox.shrink(),
            Text(label,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            !iconFirst ? icon : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
