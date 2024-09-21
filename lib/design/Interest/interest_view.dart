import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rental_motor/design/home/home_view.dart';

class InterestView extends StatefulWidget {
  const InterestView({super.key});
  static const routeName = '/interest';

  @override
  State<InterestView> createState() => _InterestViewState();
}

class _InterestViewState extends State<InterestView> {
  int selectedIndex = 0;
  List listSelected = [];
  final listPicture = [
    'honda.png',
    'kawasaki.png',
    'suzuki.png',
    'tvs.png',
    'vespa.png',
    'yamaha.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        HomeView.routeName,
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Kendaraan Anda Siap!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                ),
              ),
              const Text(
                'Kendaraan mana yang anda sukai untuk berkendaran?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: listPicture.length,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (listSelected.contains(index)) {
                            listSelected.remove(index);
                          } else {
                            listSelected.add(index);
                            selectedIndex = index;
                          }
                        });
                        log(listSelected.toString());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: (listSelected.contains(index))
                              ? BorderSide(
                                  width: 2,
                                  color: HexColor('C3E54B'),
                                )
                              : BorderSide.none,
                        ),
                        color: (listSelected.contains(index))
                            ? HexColor('C3E54B').withOpacity(0.06)
                            : Colors.grey.withOpacity(0.06),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/${listPicture[index]}',
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 52,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeView.routeName);
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
