import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constants.dart';

class CreateTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  CreateTaskAppBar({super.key})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CreateTaskAppBar> createState() => _CreateTaskAppBarState();
}

class _CreateTaskAppBarState extends State<CreateTaskAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: kLightBlue),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: SvgPicture.asset(
                'assets/icons/arrow-back-icon.svg',
                height: 20,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Add task',
        style: GoogleFonts.poppins(
          color: kDarkBlue,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
