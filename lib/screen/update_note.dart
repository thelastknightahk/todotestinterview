import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/calender_dialog.dart';
import 'package:todo/widgets/category_dialog.dart';
import 'package:todo/widgets/color_indicate_widget.dart';

class UpdateNote extends StatelessWidget {
  const UpdateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var updateTaskNameController = TextEditingController();

    return Consumer<NotePresenter>(builder: (context, presenter, child) {
      updateTaskNameController.text = presenter.categoryUpdateTask;
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 2.5, color: Colors.grey)),
                      margin: EdgeInsets.all(MARGIN_13),
                      child: Icon(Icons.close_sharp),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      
                      child: Column(
                        children: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.all(MARGIN_10),
                              child: TextField(
                                autofocus: true,
                                controller: updateTaskNameController,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 20.0),
                                ),
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
                                          actionType: 'update',
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
                                        '${presenter.categoryUpdateCalender}',
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
                                          actionType: 'update',
                                        );
                                      });
                                },
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                      color: colorList[
                                          presenter.categoryUpdateColorIndex],
                                      border: Border.all(
                                          width: 2, color: Colors.black26),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
                              Container(
                                width: 130.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: greyColor,
                                    ),
                                    Text(
                                      '${presenter.categoryUpdateTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: TEXT_REGULAR_2X,
                                          color: greyColor),
                                    )
                                  ],
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
              presenter.categoryUpdateTaskSet(updateTaskNameController.text);
              presenter.taskUpdateSet();
              Navigator.pop(context);
            },
            child: Container(
              width: 130.0,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Update",
                    style: TextStyle(color: mainColor, fontSize: TEXT_REGULAR_2X),
                  ),
                  Icon(
                    Icons.update,
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
    });
  }
}
