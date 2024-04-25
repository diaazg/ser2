import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/core/widgets/return_button.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';
import 'package:ser2/features/profile/presentation/widgets/info_contaier.dart';

class MaladProfile extends StatelessWidget {
   MaladProfile({super.key, required this.bloc});

  String? img;

/*   void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 400,
        maxWidth: 400,
        imageQuality: 75);
    Reference ref =
    FirebaseStorage.instance.ref('profile/').child(AuthController.instance.uid);
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        if (value.isNotEmpty) {
          img = value;
          HomeController.instance.updateImg(value);
        }
      });
    });
  } */
  final UserDataBloc bloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(

      canPop: false,
      child: BlocConsumer<UserDataBloc,UserDataState>(
        listener: (BuildContext context, UserDataState state) {  },
        bloc: bloc,
        builder: (context,state) {
          if(state is UserDataGetSuccessfull){
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
                                          String uid = bloc.uid;
                    bloc.add(GetUserData(uid: uid));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child:const  Center(child: Icon(Icons.navigate_before)),
                    ),
                  ),
                        SizedBox(
                          width: size.width * 0.2,
                        ),
                        Text(
                          'Myprofil',
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
                          /* final image = await ImagePicker().pickImage(
                                    source: ImageSource.gallery,
                                    maxHeight: 400,
                                    maxWidth: 400,
                                    imageQuality: 75);
                                Reference ref =
                                FirebaseStorage.instance.ref('profile/').child(AuthController.instance.uid);
                                await ref.putFile(File(image!.path));
                                ref.getDownloadURL().then((value) {
                                  print("$value gggggggggggggggggggggggggggggggg");
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      img = value;
                                      homeController.updateImg(value.toString());
                                    }
                                  });
                                }); */
                        },
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE5E8F2),
                              borderRadius: BorderRadius.circular(300)),
                          child: const Center(
                            child: CircleAvatar(
                              radius: 100,
                            ),
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
                            title: state.userModelInfo.fullName,
                            content: 'Zellagui Mohammed diaa Eddine',
                            height: 0.07,
                            width: 0.9),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        InfoContainer(
                            size: size,
                            title: 'Birth day',
                            content: state.userModelInfo.dateOfBirth,
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
                                title: 'Height',
                                content: state.userModelInfo.height.toString(),
                                height: 0.07,
                                width: 0.4),
                            InfoContainer(
                                size: size,
                                title: 'Width',
                                content: state.userModelInfo.weight.toString(),
                                height: 0.07,
                                width: 0.4)
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
                                title: 'Country',
                                content: 'Algeria',
                                height: 0.07,
                                width: 0.25),
                            InfoContainer(
                                size: size,
                                title: 'Wilaya',
                                content: state.userModelInfo.city,
                                height: 0.07,
                                width: 0.25),
                            InfoContainer(
                                size: size,
                                title: 'Commune',
                                content: state.userModelInfo.town,
                                height: 0.07,
                                width: 0.25)
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
        
          }else if(state is UserDataGetFailure){
            return Center(child: Text(state.failure.errMessage),);
          }else{
             return const Center(child: Text('wait.....'),);
          }
        }, 
      ),
    );
  }
}

