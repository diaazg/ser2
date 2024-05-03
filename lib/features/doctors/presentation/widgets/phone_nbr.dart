import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class PhoneNbrButton extends StatelessWidget {
  const PhoneNbrButton({
    super.key,
    required this.size,
    required this.phoneNbr, required this.isWomen,
  });

  final Size size;
  final String? phoneNbr;
  final bool isWomen ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       /*  String number = phoneNbr!; //set the number here
        await FlutterPhoneDirectCaller.callNumber(
            number.toString()); */
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: size.height * 0.08,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color:  isWomen?  const Color(0xFFF3C0C0): const Color(0xFF6694F6),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.call,
              color: Colors.white,
            ),
            Text(
              phoneNbr!,
              style: Kcolors.fontMain.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
