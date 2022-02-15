import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';

Widget categoryDialogItem(
    BuildContext context, int index, String categoryName, String actionType) {
  return Consumer<NotePresenter>(
    builder: (context, presenter, child) => InkWell(
      onTap: () {
        if (actionType == 'add') {
          presenter.categoryAddColorIndexSet(index);
          presenter.categoryAddNameSet(categoryName);
        } else {
          presenter.categoryUpdateColorIndexSet(index);
          presenter.categoryUpdateNameSet(categoryName);
        }

        Navigator.pop(context);
      },
      child: Container(
        width: 100.0,
        margin: EdgeInsets.only(left: 15.0, right: 3.0, top: 8.0, bottom: 8.0),
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${categoryName}",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: colorList[index],
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    ),
  );
}
