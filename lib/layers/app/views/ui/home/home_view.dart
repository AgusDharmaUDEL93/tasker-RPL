import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/app/views/ui/widgets/home_appbar.dart';

import '../../../../core/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const HomeAppBar(),
      ),
      body: Container(
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
              SizedBox(
                height: 14,
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('Title'),
                              Text('Subtitle'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(10),
                  //   child: Container(
                  //     color: Colors.grey[200],
                  //     child: ListTile(
                  //       minVerticalPadding: 14,
                  //       title: Text('Create Detail Booking'),
                  //       subtitle: Text(
                  //           'Lorem ipsum dolor sit amet, consectetur adipiscing'),
                  //       trailing: Icon(Icons.add),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
