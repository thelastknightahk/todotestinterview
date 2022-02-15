import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/category_dialogItem.dart';

class CategoryDialog extends StatefulWidget {
  String? actionType;
  CategoryDialog({Key? key, required this.actionType}) : super(key: key);

  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
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
    return Container(
      width: fullWidth,
      height: fullHeight / 7.5,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryDialogItem(
              context, 0, 'Personal', '${this.widget.actionType}'),
          categoryDialogItem(
              context, 1, 'Business', '${this.widget.actionType}'),
          categoryDialogItem(context, 2, 'Work', '${this.widget.actionType}'),
        ],
      ),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
