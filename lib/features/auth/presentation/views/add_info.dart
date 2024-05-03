import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/snacks.dart';
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
            return count++ == 4;
          });
        } else if (state is RegisterLoading) {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Kcolors.blueBackground,
                  ),
                );
              });
        } else if (state is RegisterFailure) {
          Navigator.pop(context);
          SnackBar failureSnack = SnackBar(
            content: Text(state.failure.errMessage),
            backgroundColor: Colors.red,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(failureSnack);
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
                              TitleWidget(size: size, title: 'Nom et prenom'),
                              InfoBox(
                                  size: size,
                                  bloc: fullNameBox,
                                  errMessage: 'Entrer votre nom',
                                  hintText: 'Nom et prenom',
                                  height: 0.07,
                                  width: 0.9),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              TitleWidget(
                                  size: size, title: 'Date de naissance'),
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1920),
                                          lastDate: DateTime.now())
                                      .then((value) {
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
                                      TitleWidget(size: size, title: 'Poid'),
                                      InfoBox(
                                          size: size,
                                          bloc: poidBox,
                                          errMessage: 'Combler',
                                          hintText: 'Poid',
                                          height: 0.07,
                                          width: 0.4),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Hauteur'),
                                      InfoBox(
                                          size: size,
                                          bloc: longBox,
                                          errMessage: 'Combler',
                                          hintText: 'Hauteur',
                                          height: 0.07,
                                          width: 0.4)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(size: size, title: 'Commune'),
                                  DropFillBox(
                                    size: size,
                                    bloc: widget.townBox,
                                    errMessage: 'Entrer votre commune',
                                    hintText: 'Commune',
                                    height: 0.07,
                                    width: 0.8,
                                    listTypes: ListTypes.commune,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(size: size, title: 'Wilaya'),
                                  DropFillBox(
                                    size: size,
                                    bloc: widget.townBox,
                                    errMessage: 'Entrer votre wilaya',
                                    hintText: 'Wilaya',
                                    height: 0.07,
                                    width: 0.8,
                                    listTypes: ListTypes.wilaya,
                                  )
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
                                      TitleWidget(size: size, title: 'Sexe'),
                                      DropFillBox(
                                        size: size,
                                        bloc: gender,
                                        errMessage: 'Choisissez votre sexe',
                                        hintText: 'Sexe',
                                        height: 0.07,
                                        width: 0.35,
                                        listTypes: ListTypes.gender,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(size: size, title: 'Sang'),
                                      DropFillBox(
                                        size: size,
                                        bloc: bloodCategory,
                                        errMessage: 'Choisis ton sang',
                                        hintText: 'Sang',
                                        height: 0.07,
                                        width: 0.35,
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
                      title: 'Inscrir',
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
                          if (_formkey.currentState!.validate() &&
                              dateBox.validateDate()) {
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
                          } else if (!dateBox.validateDate()) {
                            ScaffoldMessenger.of(context).showSnackBar(errDate);
                          }
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
