import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/widget/info_boxes.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(
      {super.key,
      required this.email,
      required this.username,
      required this.password});
  final String? password;
  final String? email;
  final String? username;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String? password = widget.password;
  late String? email = widget.email;
  late String? username = widget.username;
  final BoxBloc fullNameBox = BoxBloc() ;
  final BoxBloc dateBox = BoxBloc() ;
  final BoxBloc poidBox = BoxBloc() ;
  final BoxBloc longBox = BoxBloc() ;
  final BoxBloc countryBox = BoxBloc() ;
  final BoxBloc cityBox = BoxBloc() ;
  final BoxBloc townBox = BoxBloc() ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: const Center(child: Icon(Icons.navigate_before)),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Text(
                    'Choose picture',
                    style: Kcolors.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E8F2),
                      borderRadius: BorderRadius.circular(300)),
                  child: Center(
                    child: Image.asset(
                      "images/profile/1.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Text(
                email!,
                style: Kcolors.fontMain
                    .copyWith(color: Colors.black54, fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                  child: Form(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'full_name',
                    style: Kcolors.fontMain
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                 InfoBox(size: size, bloc: fullNameBox, errMessage: 'Enter your name', hintText: 'Full name', height: 0.07, width: 0.9),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'date of birth',
                    style: Kcolors.fontMain
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                   InfoBox(size: size, bloc: dateBox, errMessage: 'Enter your date of birth', hintText: 'date of birth', height: 0.07, width: 0.9),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'weight',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          
                          InfoBox(size: size, bloc: poidBox, errMessage: 'fill the gape', hintText: 'Weight', height: 0.07, width: 0.4),
                          
                         
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'height',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InfoBox(size: size, bloc: longBox, errMessage: 'Enter your height', hintText: 'Height', height: 0.07, width: 0.4)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Country',
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                         InfoBox(size: size, bloc: countryBox, errMessage: 'Enter your country', hintText: 'Country', height: 0.07, width: 0.25)],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: Kcolors.fontMain.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InfoBox(size: size, bloc: cityBox, errMessage: 'Enter your wilaya', hintText: 'Wilaya', height: 0.07, width: 0.25)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Town",
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InfoBox(size: size, bloc: townBox, errMessage: 'Enter your town', hintText: 'Town', height: 0.07, width: 0.25)
                        ],
                      ),
                    ],
                  ),
                ],
              ))),
              SizedBox(
                height: size.height * 0.02,
              ),
              AppoButton(
                  size: size,
                  title: 'Save',
                  color: Color(0xFF496CCE),
                  fontColor: Colors.white,
                  buttonFunc: () {
                    
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
