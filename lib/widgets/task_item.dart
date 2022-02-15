import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/model/task.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

Widget taskItem(BuildContext context, TaskData taskData, int taskIndex) {
  
  return Consumer<NotePresenter>(
    builder: (context, presenter, child) => Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
      child:  Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                IconSlideAction(
                  caption: 'Update',
                  color: Colors.blue,
                  icon: Icons.update,
                  onTap: () => {
                    Navigator.pushNamed(context, '/updaeNote'),
                    presenter.categoryUpdateItemIndexSet(taskIndex),
                    presenter
                        .categoryUpdateCalenderSet( taskData.dateTask!),
                    presenter.categoryUpdateColorIndexSet(
                        taskData.colorTaskIndex!),
                    presenter.categoryUpdateTaskSet(taskData.nameTask!),
                    presenter
                        .categoryUpdateNameSet(taskData.categoryName!),
                    presenter.categoryUpdateTimeSet(taskData.timeTask!),
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.redAccent,
                  icon: Icons.delete,
                  onTap: () => {
                      
                     presenter.taskDeleteSet(taskIndex)
                    
                    },
                ),
              ],
              child: Card(
                elevation: 0.3,
                child: InkWell(
                  onTap: () => {
                    updateItem(context, presenter, taskIndex, taskData)
                  },
                  child: Container(
                    child: Row(
                      children: [
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            // var task = taskList[index];
                
                            presenter.taskUpdateSetCheck(taskData, !taskData.finishTask!, taskIndex);
                            //print('clicked circle ${index}');
                          },
                          child: Container(
                            width: 25.0,
                            height: 25.0,
                            margin: EdgeInsets.only(left: 15.0),
                            decoration: BoxDecoration(
                                color: taskData.finishTask == true
                                    ? Colors.black12
                                    : null,
                                //color: Colors.black26,
                                border: Border.all(
                                    width: 2.5,
                                    color: colorList[
                                        taskData.colorTaskIndex!]),
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "${taskData .nameTask}",
                            style: TextStyle(
                                decoration: taskData.finishTask == true
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: TEXT_REGULAR,
                                color: blackColor),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: MARGIN_MEDIUM),
                          child: Text(
                            "${taskData .timeTask}",
                            style: TextStyle(
                                decoration:  taskData.finishTask == true
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: TEXT_REGULAR,
                                color: blackColor),
                          ),
                        )
                      ],
                    ),
                    height: CARD_HEIGHT,
                  ),
                ),
              ),
            )
    ),
  );
}

void updateItem(BuildContext context, NotePresenter presenter, int taskIndex, TaskData taskData) {
       Navigator.pushNamed(context, '/updaeNote');
                    presenter.categoryUpdateItemIndexSet(taskIndex);
                    presenter
                        .categoryUpdateCalenderSet( taskData.dateTask!);
                    presenter.categoryUpdateColorIndexSet(
                        taskData.colorTaskIndex!);
                    presenter.categoryUpdateTaskSet(taskData.nameTask!);
                    presenter
                        .categoryUpdateNameSet(taskData.categoryName!);
                    presenter.categoryUpdateTimeSet(taskData.timeTask!);
}

void deleteItem(BuildContext context) {
  print("Delete");
}
