import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/intl.dart';

import '../../ui.dart';

class UpdateCheckPatientForm extends StatefulWidget {
  const UpdateCheckPatientForm({Key? key}) : super(key: key);

  @override
  State<UpdateCheckPatientForm> createState() => _UpdateCheckPatientFormState();
}

class _UpdateCheckPatientFormState extends State<UpdateCheckPatientForm> {
  TextEditingController edtComplaint = TextEditingController();
  TextEditingController edtDiagnose = TextEditingController();

  @override
  void initState() {
    edtComplaint.text = Wording.complaintDummyValue;
    edtDiagnose.text = Wording.doctorDiagnoseDummyValue;
    super.initState();
  }

  @override
  void dispose() {
    edtComplaint.dispose();
    edtDiagnose.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PicSchedule? _picSchedule;
    Poly? _poly;
    int? _queueNo;

    if (ModalRoute.of(context)!.settings.arguments is Map) {
      var mapData = ModalRoute.of(context)!.settings.arguments as Map;

      _picSchedule = mapData['pic_schedule'];
      _poly = mapData['poly'];
      _queueNo = mapData['queue_no'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.updateCheckResult),
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
                  _picSchedule,
                  _poly,
                  _queueNo,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                _buildDoctorAndPolySection(
                  context,
                  _picSchedule,
                  _poly,
                  _queueNo,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                _buildIdAndQueueNoSection(
                  context,
                  _picSchedule,
                  _poly,
                  _queueNo,
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
                  edtComplaint,
                  edtDiagnose,
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
                  buttonText: Wording.save,
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
    BuildContext context,
    PicSchedule? schedule,
    Poly? poly,
    int? queueNo,
  ) {
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
                  DateTime.now(),
                ),
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
                schedule?.startHour ?? "-",
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorAndPolySection(
    BuildContext context,
    PicSchedule? schedule,
    Poly? poly,
    int? queueNo,
  ) {
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
                poly?.name ?? "-",
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
                schedule?.doctor?.name ?? "-",
                style: FontHelper.h8Bold(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIdAndQueueNoSection(
    BuildContext context,
    PicSchedule? schedule,
    Poly? poly,
    int? queueNo,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.idNo,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                "462845659290473337",
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
                Wording.queueNumber,
                style: FontHelper.h9Regular(),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                queueNo.toString(),
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
    BuildContext context,
    TextEditingController complaint,
    TextEditingController diagnose,
  ) {
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
        TextField(
          controller: complaint,
          maxLines: null,
          style: FontHelper.h8Regular(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Palette.greyLighten2,
              ),
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Palette.hospitalPrimary,
              ),
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
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
        // Container(
        //   width: double.maxFinite,
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 15.0,
        //     horizontal: 10.0,
        //   ),
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Palette.greyLighten3,
        //     ),
        //     borderRadius: BorderRadius.circular(
        //       5.0,
        //     ),
        //   ),
        //   child: Text(
        //     Wording.doctorDiagnoseDummyValue,
        //     style: FontHelper.h8Regular(),
        //   ),
        // ),
        TextField(
          controller: diagnose,
          maxLines: null,
          style: FontHelper.h8Regular(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Palette.greyLighten2,
              ),
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Palette.hospitalPrimary,
              ),
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
