import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constants.dart';

class DataRangeResetButton extends StatelessWidget {
  const DataRangeResetButton({
    super.key,
    required this.refresh,
  });

  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: kLightBlue),
        ),
        child: InkWell(
          onTap: () => refresh('', firstDate: null, secondDate: null),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: SvgPicture.asset(
              'assets/icons/reset-icon.svg',
              color: kSecondaryColor,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
