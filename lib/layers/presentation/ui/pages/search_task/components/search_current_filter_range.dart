import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrentFilterRange extends StatelessWidget {
  const CurrentFilterRange({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: 'from ',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text:
                    '${DateFormat("MMM").format(startDate)}, ${startDate.day}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'to ',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: '${DateFormat("MMM").format(endDate)}, ${endDate.day}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
