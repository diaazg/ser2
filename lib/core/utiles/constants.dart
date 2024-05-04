import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Day { today , tomorrow } 


class Kcolors{
 static final fontMain= GoogleFonts.poppins(
  color: Colors.white54, fontSize: 20,fontWeight: FontWeight.w300);
 static  Color blueBackground=const Color(0xFF6694F6);
 static  Color tealBackground=const Color(0xff088f8f);
 static const  Color authBoxColor = Color(0xFFD9D9D9) ;
}

class Kpadding {
  static const   authBoxPadding =  EdgeInsets.symmetric(horizontal: 20,vertical: 2);
  static const   pagePadding =  EdgeInsets.symmetric(vertical: 30, horizontal: 20);

}

class Kredius {
  static  BorderRadius authBoxRadius = BorderRadius.circular(20);
}

class AppoButton extends StatelessWidget {
 const AppoButton({
  super.key,
  required this.size,
  required this.title,
  required this.color,
  required this.fontColor,
  required this.buttonFunc
 });

 final Size size;
 final Function()? buttonFunc;
 final String title;
 final Color color;
 final Color fontColor;

 @override
 Widget build(BuildContext context) {
  return GestureDetector(
   onTap: buttonFunc,
   child:  Container(
    height: size.height*0.08,
    width: size.width*0.8,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Center(
     child: Text(title,style: Kcolors.fontMain.copyWith(color: fontColor,fontSize: 18),),
    ),


   ),
  );
 }
}

class DateCard extends StatelessWidget {
 const DateCard({
  super.key,
  required this.size,
  required this.icon,
  required this.info1,
  required this.info2
 });

 final Size size;
 final IconData icon;
 final String info1;
 final String info2;

 @override
 Widget build(BuildContext context) {
  return Container(
   height: size.height*0.2,
   width: size.width*0.3076,
   decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(20)
   ),
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
     Icon(icon,color: const Color(0xFF6694F6),),
     Text(info1,style: Kcolors.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.w600 ),),
     Text(info2,style: Kcolors.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.w300 ),)
    ],
   ),
  );
 }
}

