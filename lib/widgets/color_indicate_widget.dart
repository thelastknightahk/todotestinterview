import 'package:flutter/cupertino.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';

Widget ColorIndicate(BuildContext context){
  return   Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(MARGIN_13),
                              child: Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    color: colorList[0] ,
                                       margin: EdgeInsets.all(MARGIN_13),
                                  ),
                                  Text("Personal")
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(MARGIN_13),
                              child: Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    color: colorList[1] ,
                                    margin: EdgeInsets.all(MARGIN_13),
                                  ),
                                  Text("Business")
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(MARGIN_13),
                              child: Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    color: colorList[2] ,
                                    margin: EdgeInsets.all(MARGIN_13),
                                  ),
                                  Text("Work")
                                ],
                              ),
                            ),
                          ],
                        );
}