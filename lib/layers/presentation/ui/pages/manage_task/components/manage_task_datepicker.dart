import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tasker/layers/core/utils/constants.dart';

class ManageTaskDatepicker extends StatefulWidget {
  ManageTaskDatepicker({
    super.key,
    required this.dateTime,
    required this.refresh,
  });

  DateTime dateTime;
  Function refresh;

  @override
  State<ManageTaskDatepicker> createState() => _ManageTaskDatepickerState();
}

class _ManageTaskDatepickerState extends State<ManageTaskDatepicker> {
  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.single,
    dayTextStyle: GoogleFonts.poppins(
      fontSize: 14,
    ),
    weekdayLabelTextStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: kSecondaryColor,
    ),
    selectedDayTextStyle: GoogleFonts.poppins(
      fontSize: 14,
      color: kMainBackground,
      fontWeight: FontWeight.w600,
    ),
    selectedDayHighlightColor: kPrimaryColor,
    closeDialogOnCancelTapped: true,
    cancelButtonTextStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
    ),
    okButtonTextStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
    ),
  );

  List<DateTime?> initialValues = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormat("MMMM").format(widget.dateTime)}, ${widget.dateTime.day}',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
                fontSize: 28,
              ),
            ),
            Text(
              '${widget.dateTime.year}',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: kDarkGrey,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kPrimaryColor,
          ),
          child: InkWell(
            onTap: () {
              showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                initialValue: initialValues,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                dialogBackgroundColor: Colors.white,
              ).then(
                (value) => setState(
                  () {
                    if (value != null) {
                      widget.dateTime = value[0]!;
                      widget.refresh(value[0]!);
                    }
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                'assets/icons/calendar-icon.svg',
                color: kMainBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
