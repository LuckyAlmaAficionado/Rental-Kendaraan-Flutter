import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rental_motor/design/auth/login_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  CarouselSliderController sliderController = CarouselSliderController();

  List<Map<String, dynamic>> listString = [
    {
      'image':
          'https://www.tuguwisata.com/wp-content/uploads/2018/01/cid_daeng_acid_17_1_2018_11_48_8_76.jpg',
      'title': 'Locate the Destination',
      'subtitle':
          'Your destination is at your fingertips. Open app & enter where you want to go!',
    },
    {
      'image':
          'https://e0.pxfuel.com/wallpapers/874/756/desktop-wallpaper-he-iconic-malioboro-street-in-yogyakarta-indonesia-by-ig-jogja.jpg',
      'title': 'Select Your Root',
      'subtitle':
          'Get quick access to frequent locations, and save them as a favorite',
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/370/468/HD-wallpaper-senja-jogja-centerofjava-indonesia-java-jogjakarta-sunset-yogya-yogyakarta.jpg',
      'title': 'Locate the Destination',
      'subtitle':
          'Your destination is at your fingertips. Open app & enter where you want to go!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
              carouselController: sliderController,
              items: listString
                  .map(
                    (e) => _carouselItemBuilder(
                      context: context,
                      title: e['title'].toString(),
                      subtitle: e['subtitle'].toString(),
                      image: e['image'].toString(),
                      color: HexColor('#9DA2A7'),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: currentIndex,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  setState(() {});
                },
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: height,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.02,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: (currentIndex == index)
                                ? HexColor('C3E54B')
                                : Colors.white,
                          ),
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(right: 5),
                          width: (currentIndex == index) ? 80 : 5,
                          height: 5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 190,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 50,
                            right: 0,
                            child: Container(
                              width: 100,
                              height: 50,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                color: HexColor('D0D3D6'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.keyboard_double_arrow_right_sharp,
                                color: Colors.black.withOpacity(0.6),
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                if (currentIndex == listString.length - 1) {
                                  Navigator.of(context).pushReplacementNamed(
                                    LoginView.routeName,
                                  );
                                }

                                sliderController.nextPage();
                                setState(() {});
                              },
                              child: Text(
                                (currentIndex == listString.length - 1)
                                    ? 'Get Started'
                                    : 'Next',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _carouselItemBuilder({
    required BuildContext context,
    Color color = Colors.blue,
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 12,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 23,
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
