import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ser2/core/utiles/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key, required this.size,
  });
  final double size ;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.discreteCircle(
      size: size,
      color: Kcolors.blueBackground
    ));
  }
}