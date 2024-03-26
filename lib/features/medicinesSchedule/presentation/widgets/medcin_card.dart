import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard(
      {super.key,
      required this.size,
      required this.name,
      required this.time,
      required this.dose,
      required this.type});
  final String? name;
  final String? type;
  final List<String?> time;
  final String? dose;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "images/medicines/$type.png",
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: Kcolors.fontMain.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("$dose")
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                time[0].toString() != 'null'
                    ? Text(
                        time[0].toString(),
                        style:
                            Kcolors.fontMain.copyWith(color: Colors.black),
                      )
                    : const Text(""),
                time[1].toString() != 'null'
                    ? Text(
                        time[1].toString(),
                        style:
                            Kcolors.fontMain.copyWith(color: Colors.black),
                      )
                    : const Text(""),
                time[2].toString() != 'null'
                    ? Text(
                        time[2].toString(),
                        style:
                            Kcolors.fontMain.copyWith(color: Colors.black),
                      )
                    :const Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
