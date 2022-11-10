import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constants.dart';

class CreateTaskTextFieldWidget extends StatefulWidget {
  const CreateTaskTextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
  });

  final String labelText;
  final TextEditingController controller;

  @override
  State<CreateTaskTextFieldWidget> createState() =>
      CreateTaskTextFieldWidgetState();
}

class CreateTaskTextFieldWidgetState extends State<CreateTaskTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.poppins(
            color: kDarkGrey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: kDarkBlue,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kDarkGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kLightBlue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: kLightBlue,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
