import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';
import 'package:ser2/features/profile/presentation/views/malad_profile.dart';
import 'package:ser2/features/profile/presentation/views/medical_history.dart';
import 'package:ser2/features/profile/presentation/views/qr_code.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({super.key, required this.bloc});
  void goToPage(BuildContext context ,Widget destination ){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>destination));
  }
  
  final UserDataBloc bloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<UserDataBloc,UserDataState>(
      bloc: bloc,
      builder: (context,state) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: const Color(0xFFEAEBEC),
          body: SingleChildScrollView(
            child: Container(
              padding: Kpadding.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                        'Myprofile',
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      
                  ),
                   SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Color(0xFF6694F6),
                                    borderRadius: BorderRadius.circular(300)),
                                child: const Center(
                                  child: CircleAvatar(
                                    radius: 100,
                                    
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "Diaa",
                                style: Kcolors.fontMain.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                       
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  DashboardEelement(size: size,title: 'My profile',onTap: (){
                    String uid = bloc.uid;
                    bloc.add(GetUserData(uid: uid));
                    goToPage(context,  MaladProfile(bloc: bloc,));
                  }, iconPath: '1',),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DashboardEelement(size: size,title: 'Medical history',onTap: (){
                    goToPage(context, const MedicalHistory());
                  }, iconPath: '4',),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DashboardEelement(size: size, iconPath: 'translate', title: 'Language',onTap: (){
                     showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
                                padding:const  EdgeInsets.symmetric(vertical: 100),
                                width: size.width * 0.7,
                                height: size.height * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
        /*                                     var instance = GetStorage();
        
                                        instance.write("st", 'en');
                                        instance.write("nd", 'US');
                                        var local = Locale('en', 'US');
                                        Get.updateLocale(local);
                                        Get.appUpdate();
                                        Navigator.pop(context); */
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                                color: Kcolors.blueBackground),
                                            height: 50,
                                            width: 50,
                                            child:const Center(
                                                child: Text(
                                                  "EN",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w700,
                                                      letterSpacing: 2,
                                                      color: Colors.white),
                                                )),
                                          ),
                                         const Text(
                                            "ENGLISH",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
        /*                                     var instance = GetStorage();
                                        instance.write("st", 'fr');
                                        instance.write("nd", 'FR');
                                        var local = Locale('fr', 'FR');
                                        Get.updateLocale(local);
                                        Navigator.pop(context); */
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: Kcolors.blueBackground),
                                            height: 50,
                                            width: 50,
                                            child: const Center(
                                                child: Text(
                                              "FR",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 2,
                                                  color: Colors.white),
                                            )),
                                          ),
                                         const Text(
                                            "FRANCAIS",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 2),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    
                  },),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DashboardEelement(size: size, iconPath: '5', title: 'Qr code',onTap: (){
                    goToPage(context, const MyQr(id: '1234567890llaa'));
                  },),
                   SizedBox(
                    height: size.height * 0.02,
                  ),
                  DashboardEelement(size: size, iconPath: 'exit', title: 'Log out',onTap: () => context.read<AuthBloc>().add(LogOutEvent()),)],
              ),
            ),
          ),
        ));
      }, listener: (BuildContext context, UserDataState state) {  },
    );
  }
}

class DashboardEelement extends StatelessWidget {
  const DashboardEelement({
    super.key,
    required this.size, this.onTap, required this.iconPath, required this.title,
  });

  final Size size;
  final Function()? onTap ; 
  final String iconPath ; 
  final String title ;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Image.asset("images/profile/icons/$iconPath.png"),
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                title ,
                style: Kcolors.fontMain.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}