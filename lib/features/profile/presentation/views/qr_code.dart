import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/profile/presentation/widgets/qr_page_head.dart';
import 'package:ser2/features/profile/presentation/widgets/qr_widget.dart';

class MyQr extends StatelessWidget {
  const MyQr({super.key,required this.id, required this.img, required this.userName});
  final String id;
  final String img ;
  final String userName;

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
                        const Back(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        QrPageHead(size: size, img: img, userName: userName,),
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
                          QrWidget(size: size, id: id),
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

class Back extends StatelessWidget {
  const Back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}

