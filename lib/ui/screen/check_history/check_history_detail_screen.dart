import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/intl.dart';

import '../../ui.dart';

class CheckHistoryDetailScreen extends StatelessWidget with RandomMixin {
  const CheckHistoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionHistory? transactionData;

    if (ModalRoute.of(context)!.settings.arguments is TransactionHistory) {
      transactionData =
          ModalRoute.of(context)!.settings.arguments as TransactionHistory;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.checkHistoryDetail),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(
                26.0,
              ),
              children: [
                _buildDateTimeSection(
                  context,
                  transactionData: transactionData,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                _buildDoctorAndPolySection(
                  context,
                  transactionData: transactionData,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                _buildComplaintAndDiagnoseSection(
                  context,
                  transactionData: transactionData,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  Wording.thanks,
                  style: FontHelper.h8Bold(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  Wording.thanksGreetingHistoryDetail,
                  style: FontHelper.h8Regular(),
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: SquareButton(
                  buttonText: Wording.goBack,
                  textStyle: FontHelper.h7Regular(
                    color: Palette.white,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeSection(
    BuildContext context, {
    TransactionHistory? transactionData,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.dateHistoryDetail,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(
                  DateTime.parse(transactionData?.queue?.date ?? "-"),
                ),
                // DateFormat("dd MMMM yyyy", "id_ID").format(
                //   DateTime.parse(data[index].queue?.date ?? "-"),
                // )
                // "Minggu, 03 April 2022",
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.timeHistoryDetail,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                getRandomTime(),
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.queueNumber,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                transactionData?.queue?.queueNo.toString() ?? "-",
                style: FontHelper.h8Bold(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorAndPolySection(
    BuildContext context, {
    TransactionHistory? transactionData,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.poly,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                transactionData?.queue?.doctorSchedule?.poly?.name ?? "-",
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.doctor,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                transactionData?.queue?.doctorSchedule?.doctor?.name ?? "-",
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComplaintAndDiagnoseSection(
    BuildContext context, {
    TransactionHistory? transactionData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Complaint Section
        Text(
          Wording.complaint,
          style: FontHelper.h8Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.greyLighten3,
            ),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Text(
            transactionData?.disease ?? "-",
            style: FontHelper.h8Regular(),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Doctor Diagnose Section
        Text(
          Wording.doctorDiagnoseHistoryDetail,
          style: FontHelper.h8Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.greyLighten3,
            ),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Text(
            transactionData?.diagnoseResult ?? "-",
            style: FontHelper.h8Regular(),
          ),
        ),
      ],
    );
  }
}
