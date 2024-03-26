import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ser2/core/utiles/constants.dart';

class MyQr extends StatelessWidget {
  const MyQr({super.key,required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF6694F6),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/appointement/back.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            color: const Color(0xFF6BA4D9),
                            child: const Center(
                                child: Icon(
                                  Icons.navigate_before,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Center(
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFE5E8F2),
                                      borderRadius: BorderRadius.circular(300)),
                                  child: const Center(child: CircleAvatar(
                                    radius: 100,
                                    
                                  ),),
                                ),
                              ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                      "user name",
                                      style: Kcolors.fontMain.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                Text(
                                  "titlen"
                                      'sub title',
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.65,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF2F7FC),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
                  child: Center(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'scan',
                            style: Kcolors.fontMain.copyWith(
                                color: const Color(0xFF6694F6),
                                fontWeight: FontWeight.w900),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            height: size.height * 0.65 * 0.6,
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                                color: const Color(0xFF6BA4D9),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: QrImageView(
                                data: id,
                                size: 280,
                                // You can include embeddedImageStyle Property if you
                                //wanna embed an image from your Asset folder
                                embeddedImageStyle: const QrEmbeddedImageStyle(
                                  size: Size(
                                    100,
                                    100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Scan info',
                              style: Kcolors.fontMain.copyWith(color: Colors.black54,fontSize: 12),),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

