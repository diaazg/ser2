import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/snacks.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_bloc.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_event.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_state.dart';
import 'package:ser2/features/doctors/presentation/widgets/accorder_button.dart';
import 'package:ser2/features/doctors/presentation/widgets/filter_option_card.dart';

PersistentBottomSheetController bottomSheet(
    BuildContext context, Size size, FilterBloc bloc, AllDoctorsBloc allBloc) {
  return showBottomSheet(
      context: context,
      builder: ((context) {
        return BlocBuilder<FilterBloc, FilterState>(
            bloc: bloc,
            builder: (context, state) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 60,
                          color: Colors.black54,
                          spreadRadius: 45)
                    ],
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                height: size.height * 0.8,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * 0.8 * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterOption(
                          size: size,
                          title: 'Wilaya',
                          onChanged: (value) {
                            if (value != null) {
                              bloc.setValue('Wilaya', value);
                              bloc.add(SetWilaya(choosenWilaya: value));
                            }
                          },
                          options: bloc.wilayat,
                          hintText: 'Wilaya',
                        ),
                        GestureDetector(
                          onTap: () {
                            bool oldVal = bloc.filterProps['Wilaya']!;
                            bloc.add(SetOption(prop: 'Wilaya', val: !oldVal));
                          },
                          child: CircleAvatar(
                            backgroundColor: bloc.filterProps['Wilaya'] == true
                                ? Kcolors.blueBackground
                                : Colors.grey,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.8 * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterOption(
                          size: size,
                          title: 'Commune',
                          onChanged: (value) {
                            if (value != null) {
                              bloc.setValue('Commune', value);
                            }
                          },
                          options: bloc.communes,
                          hintText: 'Commune',
                        ),
                        GestureDetector(
                          onTap: () {
                            bool oldVal = bloc.filterProps['Commune']!;
                            bloc.add(SetOption(prop: 'Commune', val: !oldVal));
                          },
                          child: CircleAvatar(
                            backgroundColor: bloc.filterProps['Commune'] == true
                                ? Kcolors.blueBackground
                                : Colors.grey,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.8 * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterOption(
                          size: size,
                          title: 'Sexe',
                          onChanged: (value) {
                            if (value != null) {
                              bloc.setValue('Gender', value);
                            }
                          },
                          options: bloc.sexe,
                          hintText: 'Sexe',
                        ),
                        GestureDetector(
                          onTap: () {
                            bool oldVal = bloc.filterProps['Gender']!;
                            bloc.add(SetOption(prop: 'Gender', val: !oldVal));
                          },
                          child: CircleAvatar(
                            backgroundColor: bloc.filterProps['Gender'] == true
                                ? Kcolors.blueBackground
                                : Colors.grey,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.8 * 0.06,
                    ),
                    Center(
                      child: Accorder(
                        onPressed: () {
                          List<String> values = [];
                          //get choose filter options
                          bloc.filterProps.forEach((key, value) {
                            if (value) {
                              values.add(key);
                            }
                          });
                          //check if the user choose options
                          if (values.isNotEmpty) {
                            Map<String, String> filterVals = {};
                            for (var element in values) {
                              if (bloc.filterValues[element] != '' &&
                                  bloc.filterValues[element] != null) {
                                filterVals.addAll(
                                    {element: bloc.filterValues[element]!});
                              }
                            }
                            //check if luser enter values to choosen options
                            if (filterVals.isNotEmpty) {
                              if (filterVals.containsKey('Commune') &&
                                  (filterVals['Commune'] == 'choose wilaya')) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(chooseWilayaErr);
                              } else {
                                allBloc
                                    .add(FilterSearchEvent(filter: filterVals));
                                Navigator.pop(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(filterValsSnack);
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(filterChoose);
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
           
            });
      }));
}
