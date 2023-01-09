import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 15,
        onPressed: () {
          setState(() {
            selected = !selected;
          });
        },
        icon: selected == true
            ? Icon(
                Icons.favorite,
                color: Colors.red,
          size: 22,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.blue,
          size: 22,
              ));
  }
}
