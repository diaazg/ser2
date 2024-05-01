import 'package:flutter/material.dart';

class ErrorCaseWidget extends StatelessWidget {
  const ErrorCaseWidget({
    super.key, required this.errMessage, required this.height, required this.width,
  });

  final String errMessage ;
  final double height ;
  final double width ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/error.png',
            height: height,
            width: width,
          ),
          Text(errMessage)
        ],
      ),
    );
  }
}
