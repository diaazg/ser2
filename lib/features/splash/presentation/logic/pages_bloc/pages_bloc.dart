import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/splash/presentation/logic/pages_bloc/pages_state.dart';

class SplashScreenCubit extends Cubit<SplashState>{
  SplashScreenCubit(this.controller):super(InitSplash());

  final PageController controller ;

  bool isLastPage = false;
  String buttonText = 'Suivante' ;
  void pictureChange(int index){
     
     isLastPage = index == 2;   
     if(isLastPage){
      buttonText = 'Commencer' ; 
     } else {
      buttonText = 'Suivante' ;
     }     
     emit(InitSplash()) ; 
  }

  void smoothChange(index){
    controller.animateToPage(
               index,
                duration:const Duration(milliseconds: 500), 
                curve: Curves.ease
    );
     isLastPage = index == 2;   
     if(isLastPage){
      buttonText = 'Commencer' ; 
     } else {
      buttonText = 'Suivante' ;
     }     
     emit(InitSplash()) ; 

  }


  

  

}