import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

class CalenderDialog extends StatefulWidget {
  String actionType;
  CalenderDialog({
    Key? key,
    required this.actionType,
  }) : super(key: key);

  @override
  _CalenderDialogState createState() => _CalenderDialogState();
}

class _CalenderDialogState extends State<CalenderDialog> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(paddingDialog),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    return Consumer<NotePresenter>(
      builder: (context, presenter, child) => Container(
        width: fullWidth,
        height: fullHeight / 3.5,
        margin: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
        decoration: BoxDecoration(
            color: greyColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            CalendarTimeline(
              showYears: true,
              initialDate: _selectedDate!,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                if (this.widget.actionType == 'add') {
                  presenter.categoryAddCalenderSet(
                      "${date!.day}-${date.month}-${date.year}");
                } else {
                  presenter.categoryUpdateCalenderSet(
                      "${date!.day}-${date.month}-${date.year}");
                }

                Navigator.of(context).pop();
              },
              leftMargin: 20,
              monthColor: Colors.white70,
              dayColor: Colors.teal[200],
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
          ],
        ),
      ),
    );
  }
}
