import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class HistoryType extends StatelessWidget {
  const HistoryType({super.key, required this.type});
  final MedicalType type ;
  @override
  Widget build(BuildContext context) {
    return Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       type.name.toUpperCase(),
                       style: Kcolors.fontMain.copyWith(
                           color: Colors.black,
                           fontSize: 18,
                           fontWeight: FontWeight.w600),
                     ),
                     Text(
                       "see all",
                       style: Kcolors.fontMain.copyWith(
                           color: Colors.black,
                           fontSize: 18,
                           fontWeight: FontWeight.w900),
                     )
                   ],
                 );
  }
}

enum MedicalType {archive , active} 