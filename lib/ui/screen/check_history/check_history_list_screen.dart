import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';
import 'package:intl/intl.dart';

class CheckHistoryListScreen extends StatelessWidget {
  const CheckHistoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.checkHistory),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          26.0,
        ),
        children: [
          CheckHistoryItem(
            polyValue: 'Poli Umum',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Wiwiek Sagita',
            action: () => Navigator.pushNamed(
              context,
              RouteName.checkHistoryDetailScreen,
            ),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Gigi',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Chandra',
            action: () => print("Lihat detail history check pressed 2"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Penyakit Dalam',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Ali ali',
            action: () => print("Lihat detail history check pressed 3"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Umum',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Wiwiek Sagita',
            action: () => print("Lihat detail history check pressed 1"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Gigi',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Chandra',
            action: () => print("Lihat detail history check pressed 2"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Penyakit Dalam',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Ali ali',
            action: () => print("Lihat detail history check pressed 3"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Umum',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Wiwiek Sagita',
            action: () => print("Lihat detail history check pressed 1"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Gigi',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Chandra',
            action: () => print("Lihat detail history check pressed 2"),
          ),
          CheckHistoryItem(
            polyValue: 'Poli Penyakit Dalam',
            dateTimeValue: DateFormat("dd MMMM yyyy hh:mm", "id_ID").format(
              DateTime.now(),
            ),
            doctorName: 'Dr. Ali ali',
            action: () => print("Lihat detail history check pressed 3"),
          ),
        ],
      ),
    );
  }
}
