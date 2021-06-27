import 'package:crypto_ui/utils/utils.dart';
import 'package:crypto_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SecretWords extends StatefulWidget {
  const SecretWords({Key key}) : super(key: key);

  @override
  _SecretWordsState createState() => _SecretWordsState();
}

class _SecretWordsState extends State<SecretWords> {
  List<SecretWord> _selectedWords = [];
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 3,
              children: _secretWords
                  .map((word) => GestureDetector(
                        onTap: () {
                          setState(() {
                            word.isSelected = !word.isSelected;
                            if (_selectedWords.contains(word)) {
                              _selectedWords.remove(word);
                            } else {
                              _selectedWords.add(word);
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            height: 35.0,
                            width: 75.0,
                            child: Center(
                              child: Text(word.word,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white)),
                            ),
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: word.isSelected
                                      ? Colors.green
                                      : Colors.indigoAccent,
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(18.0),
                              color: word.isSelected
                                  ? Colors.green
                                  : Colors.indigoAccent,
                            ),
                          ),
                        ),
                      ))
                  .toList()),
          bottomSheet: Padding(
            padding: const EdgeInsets.only(top: 1.0, bottom: 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 50.0,
                    color: Palette.mainColor.withOpacity(0.35),
                    child: ListView(
                        children: _selectedWords.length == 0
                            ? [
                                Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: saved,
                                            onChanged: (value) =>
                                                setState(() => saved = value)),
                                        Text(
                                            "I have saved my 12 words and I'll make everything I can do to not share them with anyone"),
                                      ],
                                    ))
                              ]
                            : _selectedWords
                                .map(
                                  (word) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AnimatedContainer(
                                      height: 35.0,
                                      width: 75.0,
                                      child: Center(
                                        child: Text(word.word,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      duration: Duration(milliseconds: 500),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: word.isSelected
                                                ? Colors.green
                                                : Colors.indigoAccent,
                                            width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        color: word.isSelected
                                            ? Colors.green
                                            : Colors.indigoAccent,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        scrollDirection: Axis.horizontal)),
                const SizedBox(height: 10.0),
                Button(
                    iconFirst: false,
                    icon: Icon(Entypo.forward, color: Colors.white),
                    label: "Next",
                    color: Palette.mainColor,
                    pressCallback: () => print("next")),
              ],
            ),
          )),
    );
  }
}

List<SecretWord> _secretWords = [
  SecretWord(word: "Number", isSelected: false),
  SecretWord(word: "Random", isSelected: false),
  SecretWord(word: "Number", isSelected: false),
  SecretWord(word: "Beta", isSelected: false),
  SecretWord(word: "Bravo", isSelected: false),
  SecretWord(word: "Number", isSelected: false),
  SecretWord(word: "Epsilon", isSelected: false),
  SecretWord(word: "Number", isSelected: false),
  SecretWord(word: "Yolo", isSelected: false),
  SecretWord(word: "Alpha", isSelected: false),
  SecretWord(word: "Number", isSelected: false),
  SecretWord(word: "Delta", isSelected: false),
];
