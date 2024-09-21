import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rental_motor/design/details/details_view.dart';
import 'package:rental_motor/utils/custom_textfield.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final listPicture = [
    'honda.png',
    'kawasaki.png',
    'suzuki.png',
    'tvs.png',
    'vespa.png',
    'yamaha.png',
  ];

  final listTipeKendaraan = [
    'Semua Transmisi',
    'Manual',
    'Otomatis',
  ];

  late PersistentBottomSheetController bottomSheetState;
  RangeValues currentRangeValues = const RangeValues(0, 2000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu_outlined),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    const SizedBox(width: 5),
                    Text('DIY, Yogyakarta'),
                    const SizedBox(width: 5),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://cdn.antaranews.com/cache/1200x800/2022/03/19/WhatsApp-Image-2022-03-19-at-09.29.12.jpeg',
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Hello Johnson',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Text(
              "Let's find your favorite car here",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: CustomTextfield(
                    hintText: 'Search',
                    preffixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (context) => StatefulBuilder(
                        builder: (context, setState) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rentang Harga',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                  activeTrackColor:
                                      HexColor('C3E54B').withRed(200),
                                  thumbColor: HexColor('C3E54B'),
                                  inactiveTrackColor: Colors.grey.shade300,
                                  trackShape:
                                      const RoundedRectSliderTrackShape(),
                                  trackHeight: 1.0,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 10.0,
                                    elevation: 0,
                                    pressedElevation: 0,
                                  ),
                                ),
                                child: RangeSlider(
                                  max: 2000000,
                                  min: 0,
                                  divisions: 2000000 ~/ 50000,
                                  labels: RangeLabels(
                                    'Rp. ${currentRangeValues.start.round()}',
                                    'Rp. ${currentRangeValues.end.round()}',
                                  ),
                                  values: currentRangeValues,
                                  onChanged: (value) {
                                    setState(() {
                                      currentRangeValues = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Merek Kendaraan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Wrap(
                                  spacing: 7.0,
                                  runSpacing: 7.0,
                                  children: List.generate(
                                    listPicture.length,
                                    (index) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: HexColor('C3E54B'),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          '${listPicture[index].split('.').first}'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Tipe Kendaraan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Wrap(
                                  spacing: 7.0,
                                  runSpacing: 7.0,
                                  children: List.generate(
                                    listTipeKendaraan.length,
                                    (index) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: HexColor('C3E54B'),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(listTipeKendaraan[index]),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 52,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Finish',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('C3E54B'),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Merk Trending',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: listPicture.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(right: 10),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 60,
                      child: Image.asset(
                        'assets/images/${listPicture[index]}',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kendaraan Terlaris',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                )
              ],
            ),
            Column(
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailView.routeName,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/vario/vario_125_black.jpg',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vario 125 ABS',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star_rate_rounded,
                                    color: Colors.amber),
                                Text('5.0'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.engineering),
                                Text('150 CC'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.speed_sharp),
                                Text('Matic'),
                              ],
                            ),
                            Text('Rp. 200.000'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
