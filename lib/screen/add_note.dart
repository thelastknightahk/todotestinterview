import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/calender_dialog.dart';
import 'package:todo/widgets/category_dialog.dart';
import 'package:todo/widgets/color_indicate_widget.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotePresenter>(
      builder: (context, presenter, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 2.5, color: Colors.grey)),
                  margin: EdgeInsets.all(MARGIN_13),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close_sharp)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                   
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(MARGIN_10),
                          child: TextField(
                            autofocus: true,
                            onChanged: (value) {
                              presenter.categoryAddTaskSet(value);
                            },
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter New Task',
                              hintStyle: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CalenderDialog(
                                        actionType: 'add',
                                      );
                                    });
                              },
                              child: Container(
                                width: 130.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: greyColor,
                                    ),
                                    Text(
                                      '${presenter.categoryAddCalender} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: TEXT_REGULAR_2X,
                                          color: greyColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CategoryDialog(
                                        actionType: 'add',
                                      );
                                    });
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                    color: colorList[
                                        presenter.categoryAddColorIndex],
                                    border: Border.all(
                                        width: 2, color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.circular(15.0)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _selectTime(context, presenter);
                              },
                              child: Container(
                                width: 130.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: greyColor,
                                    ),
                                    Text(
                                      '${presenter.categoryAddTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: TEXT_REGULAR_2X,
                                          color: greyColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                       ColorIndicate(context)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
           DateTime now = new DateTime.now();
          String currentDate = "${now.day}-${now.month}-${now.year}";
          
            var task = Task(
                categoryName: '${presenter.categoryAddName}',
                colorTaskIndex: presenter.categoryAddColorIndex,
                dateTask: presenter.categoryAddCalender.compareTo("Today") == 0 ? currentDate : '${presenter.categoryAddCalender} ',
                finishTask: false,
                nameTask: '${presenter.categoryTaskName} ',
                timeTask: '${presenter.categoryAddTime}');
            presenter.taskListSet(task);

            Navigator.pop(context);
          },
          child: Container(
            width: 130.0,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "New Task",
                  style: TextStyle(color: mainColor, fontSize: TEXT_REGULAR_2X),
                ),
                Icon(
                  Icons.keyboard_arrow_up,
                  color: mainColor,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context, NotePresenter presenter) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      // print('AM Pm time  ${timeOfDay.period.name} ');
      presenter.categoryAddTimeSet(
          "${timeOfDay.hour}:${timeOfDay.minute} ${timeOfDay.period.name} ");
    }
  }
}
