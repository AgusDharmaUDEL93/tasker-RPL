import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: kLightBlue),
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/darkmode-icon.svg',
                  height: 20,
                  color: kSecondaryColor,
                ),
              ),
            ),
          ),
          Text(
            '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('d').format(DateTime.now())}',
            style: GoogleFonts.poppins(
              color: kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: kLightBlue),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, kSearchTaskRoute);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                child: SvgPicture.asset(
                  'assets/icons/search-icon.svg',
                  height: 30,
                  color: kSecondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
