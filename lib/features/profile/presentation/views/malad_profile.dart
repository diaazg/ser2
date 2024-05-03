import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';
import 'package:ser2/features/profile/presentation/widgets/info_contaier.dart';

class MaladProfile extends StatefulWidget {
  MaladProfile({super.key, required this.bloc});

  final UserDataBloc bloc;

  @override
  State<MaladProfile> createState() => _MaladProfileState();
}

class _MaladProfileState extends State<MaladProfile> {
  String? img;

  void pickUploadImage(String uid, UserDataBloc bloc) async {
    final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 400,
        maxWidth: 400,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref('profile/').child(uid);
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          img = value;
          bloc.add(UpdateImage(url: value));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: BlocConsumer<UserDataBloc, UserDataState>(
        listener: (BuildContext context, UserDataState state) {},
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is UserDataGetSuccessfull) {
            return SafeArea(
                child: Scaffold(
              backgroundColor: const Color(0xFFEAEBEC),
              body: SingleChildScrollView(
                child: Container(
                  padding: Kpadding.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              String uid = widget.bloc.uid;
                              widget.bloc.add(GetUserData(uid: uid));
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              color: const Color(0xFFEAEBEC),
                              child: const Center(
                                  child: Icon(Icons.navigate_before)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                          ),
                          Text(
                            'Profile',
                            style: Kcolors.fontMain.copyWith(
                                color: Colors.black,
                                fontSize: 30,
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
                        child: GestureDetector(
                          onTap: () async {
                            pickUploadImage(widget.bloc.uid, widget.bloc);
                          },
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE5E8F2),
                                borderRadius: BorderRadius.circular(300)),
                            child: Center(
                              child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage: state.userModelInfo.img == ''
                                      ? null
                                      : NetworkImage(
                                          '${state.userModelInfo.img}')),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        state.userModelInfo.userName,
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
                          InfoContainer(
                              size: size,
                              title: 'Nom et prenom',
                              content: state.userModelInfo.fullName,
                              height: 0.07,
                              width: 0.9),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InfoContainer(
                              size: size,
                              title: 'Date de naissance',
                              content:
                               DateFormat('dd-MM-yyyy').format(state.userModelInfo.dateOfBirth)
                                  .toString(),
                              height: 0.07,
                              width: 0.9),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InfoContainer(
                                  size: size,
                                  title: 'Hauteur',
                                  content:
                                      state.userModelInfo.height.toString(),
                                  height: 0.07,
                                  width: 0.2),
                                  InfoContainer(
                                  size: size,
                                  title: 'Sang',
                                  content: state.userModelInfo.blood.toString(),
                                  height: 0.07,
                                  width: 0.2),
                              InfoContainer(
                                  size: size,
                                  title: 'Poid',
                                  content:
                                      state.userModelInfo.weight.toString(),
                                  height: 0.07,
                                  width: 0.2)
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              InfoContainer(
                                  size: size,
                                  title: 'Wilaya',
                                  content: state.userModelInfo.city,
                                  height: 0.07,
                                  width: 0.4),
                              InfoContainer(
                                  size: size,
                                  title: 'Commune',
                                  content: state.userModelInfo.town,
                                  height: 0.07,
                                  width: 0.4)
                            ],
                          ),
                        ],
                      ))),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ));
          } else if (state is UserDataGetFailure) {
            return SafeArea(
                child: Scaffold(
                    backgroundColor: const Color(0xFFEAEBEC),
                    body: ErrorCaseWidget(
                        errMessage: state.failure.errMessage,
                        height: 200,
                        width: 200)));
          } else {
            return const Scaffold(
                backgroundColor: Color(0xFFEAEBEC),
                body: LoadingWidget(size: 100));
          }
        },
      ),
    );
  }
}
