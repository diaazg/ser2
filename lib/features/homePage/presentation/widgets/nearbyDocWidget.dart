import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';

class NearByDocWidget extends StatelessWidget {
  const NearByDocWidget({
    super.key,
    required this.size,
    required this.nearbyDoctor,
  });

  final Size size;
 final DoctorModel nearbyDoctor;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfile(docName: nearbyDoctor.fullName, id: 'id', specialite:nearbyDoctor.speciality, wilaya:nearbyDoctor.speciality, commune:nearbyDoctor.commune, phoneNbr: nearbyDoctor.phoneNbr, about: nearbyDoctor.about,)));
      },
      child: Container(
        margin:const  EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 5),
        height: size.height * 0.17,
        width: size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                  color: const Color(0xFFF3C0C0),
                  borderRadius:
                      BorderRadius.circular(20)),
              child: Container(
                child: Center(
                  child: Image.asset(
                    "images/appointement/7.png",
                    height: size.height * 0.15,
                    width: size.width * 0.2,
                  ),
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
                    "Dr-${nearbyDoctor.fullName} ",
                    style: Kcolors.fontMain.copyWith(
                        color: Color(0xFFF3C0C0),
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Specialiy : ${nearbyDoctor.speciality} ",
                    style: Kcolors.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    padding:const  EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: 40,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(20),
                        color: Color(0xFFF3C0C0)),
                    child: Center(
                      child: Text(
                        'More',
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


          ],
        ),
      ),
    );
  }
}

