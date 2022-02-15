import 'package:flutter/material.dart';
import 'package:todo/model/category.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

Widget CategoryItem(BuildContext context, Category category, int index, int taskCount, double percentFinish ) {
  return   InkWell(
    onTap: (){
      Navigator.pushNamed(context, '/categoryPage', arguments: {'categoryType':category.categoryName!.trim() } );
    },
    child: Card(
            child: Container(
              width: 200,
              margin: EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Text(
                      '${taskCount } tasks',
                      style: TextStyle(color: greyColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Text(
                      '${category.categoryName}',
                      style: TextStyle(
                          color: blackColor,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: LinearProgressIndicator(
                      value:  percentFinish ,
                      backgroundColor:  indicatorColor,
                      color: colorList[index],
                    ),
                  )
                ],
              ),
            ),
          ),
  );
}
