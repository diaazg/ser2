import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_bloc.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_event.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';
import 'package:ser2/features/doctors/presentation/widgets/show_bottom_sheet.dart';

class SerarchWidget extends StatelessWidget {
  const SerarchWidget({
    super.key,
    required this.size,
    required this.bloc,
    required this.doctors,
    required this.uid,
  });

  final Size size;
  final AllDoctorsBloc bloc;
  final List<DoctorModel> doctors;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.09 * 0.7,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.1 * 0.3,
                width: size.width * 0.5,
                child: SearchField(
                  suggestions: doctors
                      .map((e) => SearchFieldListItem(e.fullName,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoctorProfile(
                                                nearbyDoctor: e,
                                                uid: uid,
                                              )));
                                },
                                child: Text(
                                  e.fullName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          )))
                      .toList(),
                  suggestionState: Suggestion.expand,
                  hint: 'Doctor name',
                  searchStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  validator: (x) => x!.isEmpty ? 'Please enter' : null,
                  searchInputDecoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Kcolors.blueBackground,
                      ),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Kcolors.blueBackground)),
                      hoverColor: Colors.black,
                      fillColor: Colors.black,
                      focusColor: Colors.black,
                      isCollapsed: false),
                  maxSuggestionsInViewPort: 2,
                  itemHeight: 50,
                  onSubmit: (x) {
                    /*     setState(() {
                    searchDoctor = x;
                  }); */
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  FilterBloc filterBloc = FilterBloc();
                  filterBloc.add(InitWilayaList());
                  bottomSheet(context, size, filterBloc, bloc);
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Kcolors.blueBackground,
                        borderRadius: BorderRadius.circular(200)),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum ListTypes { wilaya, commune, gender }
