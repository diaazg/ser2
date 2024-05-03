import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';
import 'package:ser2/features/appointment/data/repos/appointment_imp.dart';
import 'package:ser2/features/appointment/presentation/logic/my_appointements/my_apt_bloc.dart';
import 'package:ser2/features/appointment/presentation/view/appointments_list.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:ser2/features/profile/data/repo/medicalHistory/medical_history_imp.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';
import 'package:ser2/features/profile/presentation/views/malad_profile.dart';
import 'package:ser2/features/profile/presentation/views/medical_history.dart';
import 'package:ser2/features/profile/presentation/views/qr_code.dart';
import 'package:ser2/features/profile/presentation/widgets/dashboard_element.dart';
import 'package:ser2/features/profile/presentation/widgets/profile_picture.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({super.key, required this.bloc});
  void goToPage(BuildContext context, Widget destination) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  final UserDataBloc bloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  'Privé',
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              BlocConsumer<UserDataBloc, UserDataState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is UserDataGetSuccessfull) {
                    return Center(
                      child: Column(
                        children: [
                          ProfilePicture(
                            imgUrl: state.userModelInfo!.img,
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            state.userModelInfo.userName,
                            style: Kcolors.fontMain.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    );
                  } else if (state is UserDataGetFailure) {
                    return Center(child: ErrorCaseWidget(errMessage: state.failure.errMessage, height: 200, width: 200));
                  } else {
                    return  const Center(child: LoadingWidget(size: 100));
                  }
                },
                listener: (BuildContext context, UserDataState state) {},
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              DashboardEelement(
                size: size,
                title: 'Profile',
                onTap: () {
                  String uid = bloc.uid;
                  bloc.add(GetUserData(uid: uid));
                  goToPage(
                      context,
                      MaladProfile(
                        bloc: bloc,
                      ));
                },
                iconPath: '1',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DashboardEelement(
                size: size,
                title: 'Dossier Medical',
                onTap: () {
                  String id = bloc.uid;
                  MedicalHistoryRepo repo = MedicalHistoryRepo(id,
                      storeInstance: bloc.userDataRepo.storeInstance);
                  MedicalHistoryBloc historyBloc = MedicalHistoryBloc(repo);
                  historyBloc.add(GetMedicalHistory());
                  goToPage(context, MedicalHistory(bloc: historyBloc));
                },
                iconPath: '4',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DashboardEelement(
                size: size,
                iconPath: 'visit',
                title: 'Rendu vous',
                onTap: () {
                 
                  AppointmentRepo aptRepo = AppointmentRepo();
                  MyAptBloc aptBloc = MyAptBloc(bloc.uid, aptRepo);
                  aptBloc.getMyApt();
                  Future.delayed(const Duration(milliseconds: 200), () async {
                    goToPage(context, MyAppointment(bloc: aptBloc));
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DashboardEelement(
                size: size,
                iconPath: '5',
                title: 'Qr code',
                onTap: () {
                  goToPage(
                      context,
                      MyQr(
                        id: bloc.uid,
                        img: bloc.userInfo!.img!,
                        userName: bloc.userInfo!.userName,
                      ));
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DashboardEelement(
                size: size,
                iconPath: 'exit',
                title: 'Sortir',
                onTap: () => context.read<AuthBloc>().add(LogOutEvent()),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
