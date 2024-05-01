import 'package:flutter/material.dart';

class ErrorCaseWidget extends StatelessWidget {
  const ErrorCaseWidget({
    super.key, required this.errMessage,
  });

  final String errMessage ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/error.png',
            height: 200,
            width: 100,
          ),
          Text(errMessage)
        ],
      ),
    );
  }
}
