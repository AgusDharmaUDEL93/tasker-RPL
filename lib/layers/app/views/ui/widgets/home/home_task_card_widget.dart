import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constants.dart';

class HomeTaskCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final int timeLeft;

  const HomeTaskCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.timeLeft,
  });

  @override
  State<HomeTaskCardWidget> createState() => _HomeTaskCardWidgetState();
}

class _HomeTaskCardWidgetState extends State<HomeTaskCardWidget> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 6),
          dense: true,
          horizontalTitleGap: 0.0,
          minLeadingWidth: 0,
          child: ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    radius: 30,
                    onTap: () {},
                    child: Icon(Icons.check),
                  ),
                ),
              ],
            ),
            collapsedBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.grey[300],
            collapsedTextColor: Colors.black,
            textColor: Colors.black,
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: kDarkBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            childrenPadding: EdgeInsets.symmetric(vertical: 10),
            subtitle: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 18,
                    height: 18,
                    color: widget.timeLeft > 4
                        ? Colors.green.withOpacity(0.3)
                        : widget.timeLeft > 2
                            ? Colors.yellow.withOpacity(0.3)
                            : Colors.red.withOpacity(0.3),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 10,
                          height: 10,
                          color: widget.timeLeft > 4
                              ? Colors.green
                              : widget.timeLeft > 2
                                  ? Colors.yellow
                                  : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${widget.timeLeft} days left',
                  style: GoogleFonts.poppins(color: kDarkGrey),
                ),
              ],
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: isCollapsed
                  ? Icon(Icons.keyboard_arrow_up_outlined)
                  : Icon(Icons.keyboard_arrow_down_outlined),
            ),
            children: <Widget>[
              Center(
                child: Text(widget.description),
              )
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
          ),
        ),
      ),
    );
  }
}
