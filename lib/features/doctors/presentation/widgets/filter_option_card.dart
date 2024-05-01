import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ser2/core/utiles/constants.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: size.width * 0.5,
          decoration: BoxDecoration(
              color: const Color(0xAAEAEBEC),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonFormField(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            items:
                ['alg', 'setif'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              print(value);
            },
            decoration: InputDecoration(
                hintStyle: Kcolors.fontMain
                    .copyWith(color: Colors.black, fontSize: 15),
                hintText: 'hint text',
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
