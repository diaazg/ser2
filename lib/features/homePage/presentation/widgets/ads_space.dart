import 'package:flutter/material.dart';

class AdsSpace extends StatelessWidget {
   const AdsSpace({super.key, required this.size, required this.title, required this.subTitle});
  final Size size ;
  final String title ;
  final String subTitle ;
    

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = size.width / baseWidth;
    double ffem = fem * 0.97;
    return Center(
                child: SizedBox(
                  width: 329 * fem,
                  height: 151 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle127WU5 (1:84)
                        left: 18 * fem,
                        top: 116 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 297 * fem,
                            height: 35 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0x7f20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle128NmB (1:85)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 329 * fem,
                            height: 145 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0xff20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // doctor5H7T (1:86)
                        left: 211 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 110 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/doctor-5.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // vector12yW5 (1:87)
                        left: 210 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 111 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-12.png',
                              width: 111 * fem,
                              height: 114 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // besmartbesaferpm (1:88)
                        left: 25 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 171 * fem,
                            height: 30 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child:  Text(
                                title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line9H9P (1:89)
                        left: 23 * fem,
                        top: 51 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 152 * fem,
                            height: 1 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // covid19wearmasksaeH (1:90)
                        left: 29 * fem,
                        top: 55 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 124 * fem,
                            height: 60 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child:  Text(
                                subTitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
             
  }
}