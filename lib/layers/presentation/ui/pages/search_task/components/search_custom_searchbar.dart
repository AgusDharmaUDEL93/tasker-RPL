import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:tasker/layers/presentation/ui/pages/search_task/components/search_current_filter_range.dart';
import '../../../../../core/utils/constants.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.refresh,
    this.startDate,
    this.endDate,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final Function refresh;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.range,
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

  List<DateTime?> initialValues = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 7))
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (string) => widget.refresh(string),
            cursorColor: kPrimaryColor,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: kSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kLightBlue,
                ),
              ),
              hintText: 'Search for a title',
              hintStyle: GoogleFonts.poppins(
                color: kDarkGrey,
                fontSize: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kLightBlue,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/icons/search-icon.svg',
                  color: kDarkGrey,
                ),
              ),
              filled: true,
              fillColor: kMainBackground,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 0,
          child: InkWell(
            onTap: () async {
              showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                initialValue: initialValues,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                dialogBackgroundColor: kMainBackground,
              ).then((value) {
                // Checks twice because if user only choses one date, value[1] returns
                // as null and an exception is thrown, so using these conditions this
                // can be avoided.
                if (value != null && value.length > 1) {
                  widget.refresh('', firstDate: value[0], secondDate: value[1]);
                } else if (value != null) {
                  widget.refresh('', firstDate: value[0], secondDate: value[0]);
                }
              });
            },
            child: Container(
              height: 65,
              width: _isDatesShowing() ? 110 : 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: _isDatesShowing()
                    ? const EdgeInsets.all(4)
                    : const EdgeInsets.all(14),
                child: _isDatesShowing()
                    ? CurrentFilterRange(
                        startDate: widget.startDate!,
                        endDate: widget.endDate!,
                      )
                    : SvgPicture.asset(
                        'assets/icons/calendar-icon.svg',
                        color: kMainBackground,
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _isDatesShowing() {
    return widget.startDate != null && widget.endDate != null;
  }
}
