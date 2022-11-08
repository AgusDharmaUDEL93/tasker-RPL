import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: TextStyle(color: Colors.black),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: kLightBlue),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/notification-icon.svg',
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
