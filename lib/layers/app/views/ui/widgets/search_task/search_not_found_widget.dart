import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Could not locate any\ntask with that title',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
