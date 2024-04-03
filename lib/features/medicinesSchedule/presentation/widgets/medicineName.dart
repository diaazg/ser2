import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/lists.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class MedicInputListWidget extends StatelessWidget {
  const MedicInputListWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.size, required this.startDateBloc});
  final String title;
  final String hintText;
  final Size size;
  final AddMedicineBloc startDateBloc ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          
          title,
          style: Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
       BlocBuilder<AddMedicineBloc,AddMedicinState>(
        bloc: startDateBloc,
        builder: (context,state){
        return Container(
            height: size.height * 0.07,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: SearchField(
                  searchStyle: Kcolors.fontMain
                      .copyWith(color: Colors.black, fontSize: 20),
                  onSubmit: startDateBloc.setInput,
                  validator: (val) => (state is UnValidateInputState)? 'fill the gap' : null,
                  searchInputDecoration: InputDecoration(
                      hintStyle: Kcolors.fontMain
                          .copyWith(color: Colors.black, fontSize: 20),
                      border: InputBorder.none),
                  suggestions:medicines
                      .map((e) => SearchFieldListItem(e,
                          child: Container(
                            width: size.width * 0.4,
                            padding: const EdgeInsets.all(10),
                            child: Text(e),
                          )))
                      .toList(),
                  suggestionState: Suggestion.expand,
                  hint: hintText,
                ),
              ),
            ),
          );
        
       }),
      ],
    );
  }
}
