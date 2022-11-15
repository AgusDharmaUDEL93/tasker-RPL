import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constants.dart';
import '../view/home_page.dart';
import 'home_filter_bottom_sheet.dart';

class HomeFilterDropdown extends StatefulWidget {
  HomeFilterDropdown({
    super.key,
    required this.currentIndex,
    required this.refresh,
  });

  int currentIndex;
  final Function refresh;

  @override
  State<HomeFilterDropdown> createState() => HomeFilterDropdownState();
}

class HomeFilterDropdownState extends State<HomeFilterDropdown> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _handleFABPressed();
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor,
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                contents[widget.currentIndex],
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: kMainBackground,
                ),
              ),
              const SizedBox(
                width: 16,
                child: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: kMainBackground,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return HomeFilterBottomSheet(
          child: Column(
            children: [
              _buildListItem(
                context,
                title: contents[0],
                leading: SvgPicture.asset(
                  'assets/icons/list-icon.svg',
                  height: 26,
                  width: 26,
                ),
              ),
              _buildListItem(
                context,
                title: contents[1],
                leading: SvgPicture.asset(
                  'assets/icons/checked-icon.svg',
                  height: 26,
                  width: 26,
                ),
              ),
              _buildListItem(
                context,
                title: contents[2],
                leading: SvgPicture.asset(
                  'assets/icons/unchecked-icon.svg',
                  height: 26,
                  width: 26,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    String? title,
    Widget? leading,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        widget.refresh(contents.indexOf(title.toString()));
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (leading != null) leading,
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: DefaultTextStyle(
                  child: Text(title),
                  style: GoogleFonts.poppins(
                    color: kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
