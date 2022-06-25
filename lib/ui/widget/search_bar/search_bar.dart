import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextFormField(
          onChanged: (value) {},
          onFieldSubmitted: (String? value) => print("Search param: $value"),
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.greyLighten2.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.greyLighten2.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.greyLighten2.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Palette.greyLighten2.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: Wording.searchDoctorOrPoly,
            hintStyle: FontHelper.h8Regular(
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
