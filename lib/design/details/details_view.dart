import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:rental_motor/design/address/address_view.dart';
import 'package:rental_motor/utils/custom_textfield.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  DetailView({super.key});

  static const routeName = '/detail';

  DateTimeRange? selectedRange;

  final selectedDate = TextEditingController();
  final durationDate = TextEditingController();
  final selectedTime = TextEditingController();
  final detailMotor = [
    'vario_125_black.jpg',
    'vario_125_blue.jpg',
    'vario_125_red.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vario 125'),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: detailMotor
                .map(
                  (e) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/vario/$e',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(7.0),
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.engineering_outlined,
                                color: Colors.grey),
                            const SizedBox(height: 5),
                            Text(
                              'Mesin Kendaraan',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '125 cc',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(7.0),
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.car_repair_outlined, color: Colors.grey),
                            const SizedBox(height: 5),
                            Text(
                              'Transmisi Kendaraan',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Matic',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(7.0),
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.ev_station_outlined, color: Colors.grey),
                            const SizedBox(height: 5),
                            Text(
                              'Bahan Bakar',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Pertalite',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Descriptions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nikmati perjalanan yang lebih mudah dan praktis dengan layanan sewa motor kami. Kami menyediakan berbagai jenis motor mulai dari skutik, bebek, hingga motor sport yang siap menemani perjalanan Anda. Semua motor kami dalam kondisi prima, selalu dirawat secara rutin, dan dilengkapi dengan helm serta jas hujan gratis!',
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga Sewa/Jam'),
                Text(
                  'Rp 50.000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextfield(
                                controller: selectedDate,
                                readOnly: true,
                                isTextShowing: true,
                                hintText: 'Pilih Tanggal',
                                preffixIcon:
                                    const Icon(Icons.calendar_month_outlined),
                                onTap: () async {
                                  final range = await showDateRangePicker(
                                    context: context,
                                    // locale: const Locale('id', 'ID'),
                                    builder: (context, child) => Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: HexColor('C3E54B'),
                                          secondary: HexColor('C3E54B')
                                              .withOpacity(0.4),
                                        ),
                                        dialogBackgroundColor:
                                            HexColor('C3E54B'),
                                      ),
                                      child: child!,
                                    ),
                                    barrierColor: HexColor('C3E54B'),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 30),
                                    ),
                                  );

                                  if (range != null) {
                                    setState(() {
                                      selectedRange = range;
                                      selectedDate.text =
                                          "${DateFormat('dd/MMM/yyyy', 'id_ID').format(
                                        selectedRange!.start,
                                      )} - ${DateFormat('dd/MMM/yyyy', 'id_ID').format(
                                        selectedRange!.end,
                                      )}";
                                      durationDate.text =
                                          "${(selectedDate.text.isEmpty) ? '0' : selectedRange!.duration.inDays + 1} Hari";
                                    });
                                  }
                                },
                              ),
                              const SizedBox(height: 5),
                              CustomTextfield(
                                controller: durationDate,
                                hintText: 'Durasi Hari',
                                isTextShowing: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 5),
                              CustomTextfield(
                                controller: selectedTime,
                                hintText: 'Diambil Pada Jam',
                                isTextShowing: true,
                                readOnly: true,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    useRootNavigator: true,
                                    helpText: 'Pilih Jam',
                                    initialEntryMode: TimePickerEntryMode.input,
                                    builder: (context, child) => Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: HexColor('C3E54B'),
                                          secondary: HexColor('C3E54B')
                                              .withOpacity(0.4),
                                        ),
                                        dialogBackgroundColor:
                                            HexColor('C3E54B'),
                                      ),
                                      child: child!,
                                    ),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        selectedTime.text = value
                                            .format(context)
                                            .replaceFirst('.', ':');
                                      });
                                    }
                                  });
                                },
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 52,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AddressView.routeName,
                                    );
                                  },
                                  child: const Text(
                                    'Boking Sekarang',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Boking Sekarang',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
