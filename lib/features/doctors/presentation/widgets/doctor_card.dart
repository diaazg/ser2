import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.size, this.onTap, 
  });

  final Size size;
  final Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 5),
        height: size.height * 0.17,
        width: size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                  color: const Color(0xFFF3C0C0),
                  borderRadius:
                  BorderRadius.circular(20)),
              child: Center(
                child: Image.asset(
                  "images/appointement/7.png",
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dr-Diaa",
                    style: Kcolors.fontMain.copyWith(
                        color: const Color(0xFFF3C0C0),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Specialiy : neurolist ",
                    style: Kcolors.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: 40,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        color: const Color(0xFFF3C0C0)),
                    child: Center(
                      child: Text(
                        "Veiw more ",
                        style: Kcolors.fontMain
                            .copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight:
                            FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(
              Icons.favorite,
              color: Color(0xFFF3C0C0),
            )
          ],
        ),
      ),
    );
  }
}
