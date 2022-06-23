import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.notification),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            NotificationItem(
              queueNumber: 10.toString(),
              date: "04 April 2022",
              message: "1 Jam lagi nomor antrian anda akan dipanggil",
            ),
            NotificationItem(
              queueNumber: 5.toString(),
              date: "01 Mei 2022",
              message: "30 Menit lagi nomor antrian anda akan dipanggil",
            ),
            NotificationItem(
              queueNumber: 12.toString(),
              date: "12 Juli 2022",
              message: "2 Jam lagi nomor antrian anda akan dipanggil",
            ),
          ],
        ),
      ),
    );
  }
}
