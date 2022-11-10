import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constants.dart';

class AddFirstTaskWidget extends StatelessWidget {
  const AddFirstTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          kManageTaskRoute,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kDarkBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/add-icon.svg'),
              const SizedBox(height: 10),
              Text(
                'Add your first task',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPlainWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
