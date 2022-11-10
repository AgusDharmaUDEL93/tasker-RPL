import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/constants.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
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
                  'assets/icons/menu-icon.svg',
                  height: 20,
                ),
              ),
            ),
          ),
          Text(
            '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('d').format(DateTime.now())}',
            style: GoogleFonts.poppins(
              color: kDarkBlue,
              fontWeight: FontWeight.w500,
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
                Navigator.pushNamed(context, '/search-task');
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SvgPicture.asset(
                  'assets/icons/filter-icon.svg',
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
