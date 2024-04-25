import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ser2/core/utiles/constants.dart';


import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/doctors/presentation/views/all_doctors.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/homePage/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/homePage/presentation/widgets/nearbyDocWidget.dart';
import 'package:ser2/features/homePage/presentation/widgets/special_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String?> doctors = [];
  List<String> special = ["Urology", "Neurology", "Ophtalmology", "Cardiology"];
  List<String> pic = ["urology", "brain", "eye", "cardiogram"];
  List<Color> colors = [Colors.teal, Colors.pink, Colors.cyan, Colors.yellow];
  List<DoctorModel>nearbyDoctors=[];
  @override
  void initState() {
    context.read<NearbyDoctorsBloc>().add(GetNearbyDoctorsEvent(wilaya: 'Tiaret')); 
    // TODO: implement initState
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: size.height*1.3,
          child: Column(
            children: [
              Container(
                height: size.height * 0.1 * 0.7,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.1 * 0.3,
                        width: size.width * 0.5,
                        child: SearchField(
                          suggestions: doctors
                              .map((e) => SearchFieldListItem(e!,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(e),
                                  )))
                              .toList(),
                          suggestionState: Suggestion.expand,
                          hint: 'homePage/search',
                          searchStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          validator: (x) =>
                              x!.isEmpty ? 'Please enter your commune' : null,
                          searchInputDecoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Kcolors.blueBackground,
                              ),
                              border: InputBorder.none,
                              focusedBorder:const  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hoverColor: Colors.black,
                              fillColor: Colors.black,
                              focusColor: Colors.black,
                              isCollapsed: false),
                          maxSuggestionsInViewPort: 2,
                          itemHeight: 50,
                          onSubmit: (x) {
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Kcolors.blueBackground,
                              borderRadius: BorderRadius.circular(200)),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.4,
              ),
              Center(
                child: SizedBox(
                  width: 329 * fem,
                  height: 151 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle127WU5 (1:84)
                        left: 18 * fem,
                        top: 116 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 297 * fem,
                            height: 35 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0x7f20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle128NmB (1:85)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 329 * fem,
                            height: 145 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0xff20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // doctor5H7T (1:86)
                        left: 211 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 110 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/doctor-5.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // vector12yW5 (1:87)
                        left: 210 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 111 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-12.png',
                              width: 111 * fem,
                              height: 114 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // besmartbesaferpm (1:88)
                        left: 25 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 171 * fem,
                            height: 30 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child: const Text(
                                'Be smart be safe',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line9H9P (1:89)
                        left: 23 * fem,
                        top: 51 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 152 * fem,
                            height: 1 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // covid19wearmasksaeH (1:90)
                        left: 29 * fem,
                        top: 55 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 124 * fem,
                            height: 60 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child: const Text(
                                'Covid-19\nwear masks',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              GestureDetector(
                onTap: () {
          /*                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllSpecial())); */
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('see_all'),
                    SizedBox(
                      width: size.width * 0.1 * 0.1,
                    ),
                    Container(
                        height: 30,
                        width: 30,
                        decoration:
                            BoxDecoration(color: Kcolors.blueBackground),
                        child: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return SpecialCard(
                        size: size,
                        pic: pic[index],
                        name: special[index],
                        color: colors[index],
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'nearby',
                    style: Kcolors.fontMain.copyWith(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: (){
                       AllDoctorsBloc allDoctorsBloc = AllDoctorsBloc(context.read<NearbyDoctorsBloc>().doctorsRepo);
                       allDoctorsBloc.add(SetSpeciality(special: "Urology"));
                           /* context.read<AllDoctorsBloc>().add(SetSpeciality(special: "Urology")); */ 
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> AllDoctors(bloc: allDoctorsBloc
                       ,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       const  Text('homePage/viewMore'),
                        SizedBox(
                          width: size.width * 0.1 * 0.1,
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration:
                            BoxDecoration(color: Kcolors.blueBackground),
                            child: const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              BlocConsumer<NearbyDoctorsBloc,NearbyDoctorsState>(
                listener: (BuildContext context, NearbyDoctorsState state) { 
                  if(state is DoctorNearbySuccess){
                    
                    nearbyDoctors = state.doctors;
                    
                  }
                 },
                builder: (context,state) {
                  if(state is DoctorNearbySuccess){
                                      return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: nearbyDoctors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NearByDocWidget(size: size, nearbyDoctor: nearbyDoctors[index]);
                        }),
                  );
                  }else if (state is DoctorNearbyFailure){
                    return Center(child: Text(state.failure.errMessage) ,);
                  }else{
                    return const Center(child: Text('Wait .........f.....') ,);
                  }
                
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

