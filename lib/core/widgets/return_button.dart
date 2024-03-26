import 'package:flutter/material.dart';


class ReturnButton extends StatelessWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child:const  Center(child: Icon(Icons.navigate_before)),
                    ),
                  );
  }
}