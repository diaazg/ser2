import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/lists.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class TypesInput extends StatelessWidget {
  const TypesInput({super.key, required this.size, required this.typesBloc});
  final Size size;
  final AddMedicineBloc typesBloc ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "type",
          style: Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        BlocBuilder(
          bloc: typesBloc,
          builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: size.height * 0.07,
            width: size.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: SearchField(
                suggestions: medicineTypes
                    .map((e) => SearchFieldListItem(e,
                        child: Container(
                          width: size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          child: Text(e),
                        )))
                    .toList(),
                suggestionState: Suggestion.expand,
                hint: 'type',
                searchStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                ),
                validator:(val)=> (state is UnValidateInputState)?  'Please enter the medicine type': null,
                searchInputDecoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Kcolors.blueBackground,
                    ),
                    border: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hoverColor: Colors.black,
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    isCollapsed: false),
                maxSuggestionsInViewPort: 2,
                itemHeight: 50,
                onSubmit: typesBloc.setInput,
              ),
            ),
          );
        })
      ],
    );
    ;
  }
}
