import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';


class ProjectIseng extends StatefulWidget {
  const ProjectIseng({Key? key}) : super(key: key);

  @override
  State<ProjectIseng> createState() => _ProjectIsengState();
}

class _ProjectIsengState extends State<ProjectIseng> {
  double positionLeft = 300;
  double positionBottom = 250;
  bool btnTdk = true;
  late Timer changePosition;
  bool isShow = true;

  @override
  void initState() {
    super.initState();

    // sets first value
    // _now = DateTime.now().second.toString();

    // defines a timer
    changePosition =
        Timer.periodic(const Duration(milliseconds: 300), (Timer t) {
      setState(() {
        Random random = Random();
        Random random2 = Random();
        positionLeft = random
            .nextInt(MediaQuery.of(context).size.width.toInt())
            .toDouble();

        positionBottom = random2
            .nextInt(MediaQuery.of(context).size.height.toInt())
            .toDouble();
        print('test');
      });
    });
     
 Timer.periodic(const Duration(seconds: 10), (Timer t) {
      isShow?showAlertDialog(context):null;
      isShow=false;
      print('asfasfasf');
      
    });


  }
  Future<void> showAlertDialog(context){
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
    title: const Text('Pilih'),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFB4570)
        ),
        onPressed: (){
        isShow = true;
        Navigator.pop(context);
      }, child: const Text('Oke'))
    ],
   ) );
}

Future<void> showAlertDialog1(context){
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
    title: const Text('Hehe'),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFB4570)
        ),
        onPressed: (){
          isShow=true;
        // Navigator.pop(context);
        canLaunchUrlString(link.asUri().toString());
        print(link.asUri().toString());
      }, child: const Text('Oke'))
    ],
   ) );
}

var link = const WhatsAppUnilink(
  phoneNumber: '+6282133052957',
  text: 'Yes'
);
  @override
  Widget build(BuildContext context) {
    print('build');
    if (positionLeft == 300) {
      positionLeft = MediaQuery.of(context).size.width * 0.6;
    }
    if (positionBottom == 250) {
      positionBottom = MediaQuery.of(context).size.height * 0.4;
    }

    //  Timer.periodic(const Duration(milliseconds: 2000), (timer) {
    //     // setState(() {
    //     //   print(positionLeft);
    //     //   createRandom();

    //     // });

    //     setState(() {
    //       createRandom();
    //     });
    //   });

   


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          'Yes or Yes'
        ),
      ),
      body: Stack(
        children: [
          // Container(
          //   color: Colors.white,
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: Center(
          //     child: SizedBox(
          //         width: MediaQuery.of(context).size.width > 700
          //             ? MediaQuery.of(context).size.width * 0.6
          //             : 500,
          //         height: 500,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: const [
          //             Text(
          //               'Tekan "Oke" untuk mendoakan "Imron Arrosid" semoga sukses tahun depan',
          //               style: TextStyle(
          //                   decoration: TextDecoration.none,
          //                   color: Colors.black,
          //                   fontSize: 20),
          //                   textAlign: TextAlign.center,
          //             ),
          //             SizedBox(
          //               height: 100,
          //             ),
          //           ],
          //         )),
          //   ),
          // ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.6,
              bottom: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                width: 150,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFFB4570))),
                    onPressed: () {
                      isShow=false;
                      showAlertDialog1(context);
                    },
                    child: const Text('Yes')),
              )),
          btnTdk
              ? AnimatedPositioned(
                  left: positionLeft,
                  bottom: positionBottom,
                  duration: const Duration(microseconds: 100),
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFFFB4570),
                          backgroundColor:Colors.white,
                          side: 
                              const BorderSide(color: Color(0xFFFB4570)),
                        ),
                        onHover: (bool) {},
                        onPressed: () {
                          // Timer.periodic(const Duration(milliseconds: 100),
                          //     (timer) {
                          //   setState(() {
                          //     print(positionLeft);
                          //     createRandom();
    
                          //   });
                          // });
    
                          // print(positionLeft);
                        },
                        child: const Text('No',
                            )),
                  ))
              : const SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }
}


