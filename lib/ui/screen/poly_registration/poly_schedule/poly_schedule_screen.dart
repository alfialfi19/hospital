import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/intl.dart';

import '../../../ui.dart';

class PolyScheduleScreen extends StatefulWidget {
  const PolyScheduleScreen({Key? key}) : super(key: key);

  @override
  State<PolyScheduleScreen> createState() => _PolyScheduleScreenState();
}

class _PolyScheduleScreenState extends State<PolyScheduleScreen> {
  final TextEditingController _dateInput = TextEditingController();
  MyQueue _myQueueData = MyQueue();

  @override
  void initState() {
    _dateInput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is UserHospital) {
      final userData =
          ModalRoute.of(context)!.settings.arguments as UserHospital;

      _myQueueData = _myQueueData.copyWith(
        userHospital: userData,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.queueList),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          26.0,
        ),
        children: [
          Text(
            Wording.polyScheduleGreeting,
            style: FontHelper.h8Regular(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            Wording.visitDate,
            style: FontHelper.h7Regular(),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 40.0,
            child: TextField(
              controller: _dateInput, //editing controller of this TextField
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.calendar_today),
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
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Palette
                              .hospitalPrimary, // header background color
                          onPrimary: Palette.white, // header text color
                          onSurface:
                              Palette.hospitalSecondary, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary:
                                Palette.hospitalPrimary, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  firstDate: DateTime.now(),
                  lastDate: DateTime(
                    2101,
                  ),
                );

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat("dd MMMM yyyy", "id_ID").format(pickedDate);

                  debugPrint("Picked Date: $pickedDate");
                  debugPrint("Formatted Date: $formattedDate");

                  _myQueueData = _myQueueData.copyWith(
                    date: pickedDate.toString(),
                  );

                  setState(() {
                    _dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  debugPrint("Date is not selected");
                }
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SquareButton(
            buttonText: Wording.polyList,
            textStyle: FontHelper.h7Regular(
              color: Palette.white,
            ),
            onTap: () {
              if (_dateInput.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Palette.red,
                    content: Text('Pastikan sudah memilih tanggal'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                Navigator.pushNamed(
                  context,
                  RouteName.polyListScreen,
                  arguments: ScreenArgument(
                    data: _myQueueData,
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
