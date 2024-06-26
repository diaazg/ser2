import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/splash/presentation/widgets/splash_page.dart';
import 'package:ser2/features/auth/presentation/views/login_page.dart';
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
    return Scaffold(
      body: BlocConsumer<SplashScreenCubit, SplashState>(
        bloc: splashBloc,
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 650,
                child: PageView(
                  onPageChanged: (index) {
                    splashBloc.pictureChange(index);
                  },
                  controller: splashBloc.controller,
                  children: [
                    SplashPageElement(
                      size: size,
                      img: 1,
                      title: 'Bienvenue sur sa7ti!',
                      description:
                          'Nous sommes heureux de vous aider à vous sentir mieux en prenant entièrement soin du traitement et du processus de réservation',
                    ),
                    SplashPageElement(
                        size: size,
                        img: 2,
                        title: 'Les meilleurs spécialistes !',
                        description: 'Traitement par le meilleur spécialiste du monde'),
                    SplashPageElement(
                      size: size,
                      img: 3,
                      title: 'Commencer!',
                      description: 'Rendre le processus de guérison plus facile et plus rapide',
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
                effect: const ExpandingDotsEffect(
                    dotColor: Color(0xFF6694F6),
                    activeDotColor: Color(0xFF6694F6)),
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
                  if (splashBloc.buttonText == 'Commencer') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Kcolors.blueBackground,
                    minimumSize: const Size(300, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                child: Text(
                  splashBloc.buttonText,
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              )
            ],
          );
        },
        listener: (BuildContext context, SplashState state) {},
      ),
    );
  }
}
