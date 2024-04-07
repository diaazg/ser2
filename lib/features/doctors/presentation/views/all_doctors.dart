import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';
import 'package:ser2/features/doctors/presentation/widgets/doctor_card.dart';
import 'package:ser2/features/doctors/presentation/widgets/speciality_box.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key, required this.allDoctorsBloc});

  final AllDoctorsBloc allDoctorsBloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<AllDoctorsBloc, AllDoctorsState>(
            bloc: allDoctorsBloc,
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: Container(
                      height: size.height * 0.09 * 0.7,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*  Container(
                            height: size.height * 0.1 * 0.3,
                            width: size.width * 0.5,
                            child: SearchField(
                              suggestions: doctors
                                  .map((e) => SearchFieldListItem(e.name!,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: TextButton(onPressed: (){
                                        
                                        }, child: Text(e.name!)),
                                      )))
                                  .toList(),
                              suggestionState: Suggestion.expand,
                              hint: 'Doctor name',
                              searchStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              validator: (x) =>
                                  x!.isEmpty ? 'Please enter your commune' : null,
                              searchInputDecoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Kconstants.blueBackground,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  hoverColor: Colors.black,
                                  fillColor: Colors.black,
                                  focusColor: Colors.black,
                                  isCollapsed: false),
                              maxSuggestionsInViewPort: 2,
                              itemHeight: 50,
                              onSubmit: (x) {
                                setState(() {
                                  searchDoctor = x;
                                });
                              },
                            ),
                          ), */
                            GestureDetector(
                              onTap: () {},
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
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    height: size.height * 0.09 * 0.75,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allDoctorsBloc.special.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SpecialBox(
                            allDoctorsBloc: allDoctorsBloc,
                            size: size,
                            index: index,
                          );
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return DoctorCard(
                            size: size,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DoctorProfile(
                                          docName: 'docName',
                                          id: 'id',
                                          specialite: 'specialite',
                                          wilaya: 'wilaya',
                                          commune: 'commune',
                                          phoneNbr: 'phoneNbr',
                                          lati: 222,
                                          long: 222)));
                            },
                          );
                        }),
                  )
                ],
              );
            }),
      ),
    ));
  }
}
