import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../../ui.dart';

class PolyListScreen extends StatelessWidget {
  const PolyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.selectPoly),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          26.0,
        ),
        children: [
          _buildHeaderSection(context),
          const SizedBox(
            height: 40.0,
          ),
          SquareButton(
            buttonText: 'Poli Bedah Tulang',
            textStyle: FontHelper.h7Regular(
              color: Palette.white,
            ),
            onTap: () => Navigator.pushNamed(
              context,
              RouteName.doctorSelectionScreen,
            ),
          ),
          SquareButton(
            buttonText: 'Poli Umum',
            textStyle: FontHelper.h7Regular(
              color: Palette.white,
            ),
            onTap: () => Navigator.pushNamed(
              context,
              RouteName.doctorSelectionScreen,
            ),
          ),
          SquareButton(
            buttonText: 'Poli Gigi',
            textStyle: FontHelper.h7Regular(
              color: Palette.white,
            ),
            onTap: () => Navigator.pushNamed(
              context,
              RouteName.doctorSelectionScreen,
            ),
          ),
          SquareButton(
            buttonText: 'Poli Kandungan',
            textStyle: FontHelper.h7Regular(
              color: Palette.white,
            ),
            onTap: () => Navigator.pushNamed(
              context,
              RouteName.doctorSelectionScreen,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Wording.dateVisit} -> 04 Januari 2022",
          style: FontHelper.h6Bold(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        RichText(
          text: TextSpan(
            text: Wording.note,
            style: FontHelper.h9Regular(
              color: Palette.hospitalPrimary,
            ),
            children: [
              TextSpan(
                text: Wording.doctorListNotes,
                style: FontHelper.h9Regular(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
