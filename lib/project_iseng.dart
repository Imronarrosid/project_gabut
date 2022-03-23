import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ProjectIseng extends StatefulWidget {
  const ProjectIseng({Key? key}) : super(key: key);

  @override
  State<ProjectIseng> createState() => _ProjectIsengState();
}

class _ProjectIsengState extends State<ProjectIseng> {
  double positionLeft = 300;
  double positionBottom = 250;
  bool btnTdk = true;
  @override
  Widget build(BuildContext context) {
    if (positionLeft == 300) {
      positionLeft = MediaQuery.of(context).size.width * 0.6;
    }
    if (positionBottom == 250) {
      positionBottom = MediaQuery.of(context).size.height * 0.4;
    }
    double createRandom() {
      Random random = Random();
      positionLeft =
          random.nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();

      return positionLeft;
    }

    double createRandom2() {
      Random random = Random();
      positionBottom =
          random.nextInt(MediaQuery.of(context).size.height.toInt()).toDouble();
      return positionBottom;
    }

    Timer timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        print(positionLeft);
        createRandom();
        createRandom2();
      });
    });

    // Timer(const Duration(seconds: 10), () {
    //   showAlertDialog1(context);
    //   timer.cancel();
    //   setState(() {
    //     btnTdk = false;
    //   });
    // });

    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          });

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text("Trimakasih"),
        content: const Text("Kamu juga Cantik/Ganteg"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width > 700
                    ? MediaQuery.of(context).size.width * 0.6
                    : 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Apakah saya "Imron Arrosid" ganteng?',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
            right: MediaQuery.of(context).size.width * 0.6,
            bottom: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: const Text('iya')),
            )),
        btnTdk
            ? AnimatedPositioned(
                left: positionLeft,
                bottom: positionBottom,
                duration: const Duration(microseconds: 100),
                child: Container(
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black)),
                      ),
                      onPressed: () {
                        Timer.periodic(const Duration(milliseconds: 100),
                            (timer) {
                          setState(() {
                            print(positionLeft);
                            createRandom();
                            createRandom2();
                          });
                        });

                        print(positionLeft);
                      },
                      child: const Text('Tidak',
                          style: TextStyle(color: Colors.black))),
                ))
            : const SizedBox(
                height: 0,
              )
      ],
    );
  }
}

showAlertDialog1(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Messege"),
    content: const Text(
        'Karena tombol "Tidak", kabur maka kamu harus menekan tombol "Iya"'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
