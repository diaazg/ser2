import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/splash_page.dart';
import 'package:ser2/features/splash/presentation/logic/pages_bloc/pages_bloc.dart';
import 'package:ser2/features/splash/presentation/logic/pages_bloc/pages_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final splashBloc = SplashScreenCubit(controller);
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: BlocConsumer<SplashScreenCubit,SplashState>(
        bloc: splashBloc,
        builder: (context,state) {
          return  Column(
            children: [
              SizedBox(
                height: 650,
                child:PageView(
                onPageChanged: (index) {
                splashBloc.pictureChange(index);
              },
              controller: splashBloc.controller,
              children: [
                 SplashPageElement(
                  size: size,
                  img: 1,
                  title: 'first_title',
                  description:
                  'first_sub',
                ),
                SplashPageElement(
                    size: size,
                    img: 2,
                    title: 'second_title',
                    description: 'second_sub'),
                SplashPageElement(
                  size: size,
                  img: 3,
                  title: 'third_title',
                  description: 'third_sub',
                ),

              ],
                ),

              ),
                               const SizedBox(
            height: 20,
          ),
          
          SmoothPageIndicator(
            controller: splashBloc.controller,
            count: 3,
            effect:const ExpandingDotsEffect(
                dotColor: Color(0xFF6694F6), activeDotColor: Color(0xFF6694F6)),
            onDotClicked: (index) {
              splashBloc.smoothChange(index);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
               splashBloc.controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Kconstants.blueBackground,
                minimumSize: const Size(300, 70),
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: Text(
              splashBloc.buttonText,
              style:  Kconstants.fontMain
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          )
        
            ],
          );
        }, listener: (BuildContext context, SplashState state) {  },
      ),
    );
  }
}