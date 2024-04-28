import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/widget/info_boxes.dart';
import 'package:ser2/features/auth/presentation/widget/title_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(
      {super.key,
      required this.email,
      required this.username,
      required this.password,
      required this.townBox});
  final String? password;
  final String? email;
  final String? username;
  final BoxBloc townBox;

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
  final BoxBloc bloodCategory = BoxBloc();
  final BoxBloc gender = BoxBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is RegisterSuccess) {
          int count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 3;
          });
        }
      },
      builder: (context, state) {
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
                          child:
                              const Center(child: Icon(Icons.navigate_before)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
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
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      firstDate:DateTime(1920),
                                      lastDate: DateTime.now()).then((value) {
                                            dateBox.setDateOfBirth(value!);
                                          });
                                },
                                child: DateBox(
                                    size: size,
                                    bloc: dateBox,
                                    height: 0.07,
                                    width: 0.9),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Wilaya'),
                                      DropFillBox(
                                        size: size,
                                        bloc: widget.townBox,
                                        errMessage: 'Enter your wilaya',
                                        hintText: 'Wilaya',
                                        height: 0.07,
                                        width: 0.43,
                                        listTypes: ListTypes.wilaya,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Commune'),
                                      DropFillBox(
                                        size: size,
                                        bloc: widget.townBox,
                                        errMessage: 'Enter your commune',
                                        hintText: 'Commune',
                                        height: 0.07,
                                        width: 0.43,
                                        listTypes: ListTypes.commune,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Gender'),
                                      DropFillBox(
                                        size: size,
                                        bloc: gender,
                                        errMessage: 'choose your gender',
                                        hintText: 'Gender',
                                        height: 0.07,
                                        width: 0.43,
                                        listTypes: ListTypes.gender,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Blood'),
                                      DropFillBox(
                                        size: size,
                                        bloc: bloodCategory,
                                        errMessage: 'choose your blood',
                                        hintText: 'Blood',
                                        height: 0.07,
                                        width: 0.43,
                                        listTypes: ListTypes.blood,
                                      )
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
                        gender.validateGender();
                        bloodCategory.validateBlood();
                        widget.townBox.validateWilaya();
                        widget.townBox.validateCommune();
                        Future.delayed(const Duration(milliseconds: 200),
                            () async {
                          if (_formkey.currentState!.validate() && dateBox.validateDate()) {
                            UserModelInfo userModel = UserModelInfo(
                                fullName: fullNameBox.input!,
                                dateOfBirth: dateBox.dateOfBirth!,
                                weight: double.parse(poidBox.input!),
                                height: double.parse(longBox.input!),
                                city: widget.townBox.city!,
                                town: widget.townBox.town!,
                                email: email,
                                password: password,
                                userName: username!,
                                gender: gender.input!,
                                blood: bloodCategory.input!);

                            context
                                .read<AuthBloc>()
                                .add(RegisterEvent(userModelReg: userModel));
                          } else {}
                        });
                      })
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
