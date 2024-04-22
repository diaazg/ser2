import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/widget/info_boxes.dart';
import 'package:ser2/features/auth/presentation/widget/title_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(
      {super.key,
      required this.email,
      required this.username,
      required this.password, required this.townBox});
  final String? password;
  final String? email;
  final String? username;
  final BoxBloc townBox ;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _formkey = GlobalKey<FormState>();

  late String? password = widget.password;
  late String? email = widget.email;
  late String? username = widget.username;
  final BoxBloc fullNameBox = BoxBloc();
  final BoxBloc dateBox = BoxBloc();
  final BoxBloc poidBox = BoxBloc();
  final BoxBloc longBox = BoxBloc();
  final BoxBloc countryBox = BoxBloc();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWidget(size: size, title: 'Full Name'),
                          InfoBox(
                              size: size,
                              bloc: fullNameBox,
                              errMessage: 'Enter your name',
                              hintText: 'Full name',
                              height: 0.07,
                              width: 0.9),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TitleWidget(size: size, title: 'Date of birth'),
                          InfoBox(
                              size: size,
                              bloc: dateBox,
                              errMessage: 'Enter your date of birth',
                              hintText: 'date of birth',
                              height: 0.07,
                              width: 0.9),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(size: size, title: 'Weight'),
                                  InfoBox(
                                      size: size,
                                      bloc: poidBox,
                                      errMessage: 'fill the gape',
                                      hintText: 'Weight',
                                      height: 0.07,
                                      width: 0.4),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(size: size, title: 'Height'),
                                  InfoBox(
                                      size: size,
                                      bloc: longBox,
                                      errMessage: 'Enter your height',
                                      hintText: 'Height',
                                      height: 0.07,
                                      width: 0.4)
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
                                  TitleWidget(size: size, title: 'City'),
                                  DropFillBox(
                                      size: size,
                                      bloc: widget.townBox,
                                      errMessage: 'Enter your wilaya',
                                      hintText: 'Wilaya',
                                      height: 0.07,
                                      width: 0.43, isWilaya: true,)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(size: size, title: 'Town'),
                                  DropFillBox(
                                      size: size,
                                      bloc: widget.townBox,
                                      errMessage: 'Enter your town',
                                      hintText: 'Town',
                                      height: 0.07,
                                      width: 0.43, isWilaya: false,)
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
                  color: const Color(0xFF496CCE),
                  fontColor: Colors.white,
                  buttonFunc: () {
                    fullNameBox.validateUserName();
                    dateBox.validateDate();
                    poidBox.validateDouble();
                    longBox.validateDouble();

                    widget.townBox.validateWilaya();
                    widget.townBox.validateCommune();
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      if (_formkey.currentState!.validate()) {
                        FirebaseAuth authInstance = FirebaseAuth.instance;
                        FirebaseFirestore storeInstance =
                            FirebaseFirestore.instance;
                        AuthRepoImp authRepo = AuthRepoImp(
                            authInstance: authInstance,
                            storeInstance: storeInstance);
                        UserModelReg userModel = UserModelReg(
                            fullName: fullNameBox.input!,
                            dateOfBirth: dateBox.input!,
                            weight: double.parse(poidBox.input!),
                            height: double.parse(longBox.input!),
                            city: widget.townBox.city!,
                            town: widget.townBox.town!,
                            email: email,
                            password: password,
                            userName: username!);
                        var response = await authRepo.register(userModel);
                        response.fold((failure) {
                          print(failure.errMessage);
                        }, (success) {
                          print(success);
                        });
                        /* Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBar())); */
                      } else {}
                    });
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
