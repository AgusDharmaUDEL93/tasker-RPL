import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/app/views/ui/widgets/home/home_appbar_widget.dart';
import 'package:tasker/layers/app/views/ui/widgets/home/home_task_card_widget.dart';

import '../../../../core/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            kCreateTaskRoute,
          );
        },
        elevation: 0,
        backgroundColor: kDarkBlue,
        child: SvgPicture.asset('assets/icons/add-icon.svg'),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const HomeAppBar(),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'In Progress',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: kDarkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                children: const [
                  SizedBox(height: 10),
                  HomeTaskCardWidget(
                    title: 'Book Cinema Tickets',
                    description: 'Aasdnasidn',
                    timeLeft: 2,
                  ),
                  SizedBox(height: 10),
                  HomeTaskCardWidget(
                    title: 'Book Cinema Tickets',
                    description: 'Aasdnasidn',
                    timeLeft: 3,
                  ),
                  SizedBox(height: 10),
                  HomeTaskCardWidget(
                    title: 'Book Cinema Tickets',
                    description: 'Aasdnasidn',
                    timeLeft: 6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
