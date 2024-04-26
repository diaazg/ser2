import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/homePage/presentation/views/home_page.dart';
import 'package:ser2/features/medicinesSchedule/presentation/views/mdecine_schedule.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/views/profile_dashboard.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.bloc});
  final UserDataBloc bloc;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  
  List<TabItem> items = [
   const  TabItem(
      icon: Icons.filter_frames,
      title: 'Profile',
    ),
   const  TabItem(
      icon: Icons.home_filled,
      title: 'Home',
    ),
  const  TabItem(
      icon: Icons.notifications_outlined,
      title: 'Notifications',
    ),

  ];
  List<Widget> screens=[];
  int visit = 1;
  @override
  void initState() {
      screens=[ProfileDashboard(bloc:widget.bloc ,), HomePage(userDataBloc: widget.bloc,), MedicineSchedule()];
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:BottomBarDefault(
            borderRadius:const BorderRadius.vertical(top: Radius.circular(20)) ,
            items: items,
            backgroundColor: Colors.white,
            color: Colors.black,
            colorSelected: Kcolors.blueBackground,
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
            animated: true,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          ) ,
          backgroundColor: const Color(0xFFF5F5F5),
          body: screens[visit],
        ));
  }
}
