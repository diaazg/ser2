import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class Accorder extends StatelessWidget {
  const Accorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Kcolors.blueBackground,
            elevation: 10),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text(
            'Accorder',
            style: TextStyle(
                color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
