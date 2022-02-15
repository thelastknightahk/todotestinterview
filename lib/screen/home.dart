import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/model/category.dart';
import 'package:todo/model/task.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/category_item.dart';
import 'package:todo/widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Category>? categoryList;
  List<Task>? taskList;
  var fullWidth, fullHeight, currentDate;

  late final Box box;
  int count = 1;
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('todoApp');

    DateTime now = new DateTime.now();
    currentDate = "${now.day}-${now.month}-${now.year}";

    Future.delayed(Duration.zero, () async {
      Provider.of<NotePresenter>(context, listen: false).taskDataGet();
    });
  }

  Future fetchCategoryData() async {
    categoryList = <Category>[];
    categoryList!.add(Category(
        categoryName: 'Personal',
        categoryColorIndex: 1,
        jobDone: 0.4,
        taskNumber: '12'));
    categoryList!.add(Category(
        categoryName: 'Business',
        categoryColorIndex: 2,
        jobDone: 0.2,
        taskNumber: '3'));
    categoryList!.add(Category(
        categoryName: 'Work',
        categoryColorIndex: 0,
        jobDone: 0.5,
        taskNumber: '24'));
    return categoryList;
  }

  Future fetchTaskList() async {
    taskList = <Task>[];
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: true,
        nameTask: 'P Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: true,
        nameTask: 'P Task2',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: false,
        nameTask: 'P Task3',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Personal',
        colorTaskIndex: 0,
        dateTask: '',
        finishTask: false,
        nameTask: 'P Task4',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Work',
        colorTaskIndex: 1,
        dateTask: '',
        finishTask: true,
        nameTask: 'W Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: false,
        nameTask: 'B Task1',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: true,
        nameTask: 'B Task2',
        timeTask: '10:00 AM'));
    taskList!.add(Task(
        categoryName: 'Business',
        colorTaskIndex: 2,
        dateTask: '',
        finishTask: false,
        nameTask: 'B Task3',
        timeTask: '10:00 AM'));

    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    return Consumer<NotePresenter>(
      builder: (context, presenter, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: MARGIN_MEDIUM_3, top: MARGIN_MEDIUM_3),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircularProgressIndicator(
                    value: presenter.jobDonePercentGet,
                    color: blueAccentColor,
                    backgroundColor: indicatorColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(MARGIN_MEDIUM_3),
                child: Text(
                  "Hello! ${presenter.greetingText } ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: TEXT_REGULAR_3X),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: MARGIN_XLARGE, left: MARGIN_MEDIUM_3),
                child: Text(
                  "CATEGORIES",
                  style:
                      TextStyle(color: blackLightColor, fontSize: TEXT_REGULAR),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MARGIN_MEDIUM_3, top: MARGIN_MEDIUM_2),
                height: fullHeight / 6,
                child: FutureBuilder(
                    future: fetchCategoryData(),
                    builder: (context, projectSnap) {
                      if (!projectSnap.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (categoryList![index]
                                    .categoryName!
                                    .compareTo('Personal') ==
                                0) {
                              return CategoryItem(
                                  context,
                                  categoryList![index],
                                  index,
                                  presenter.personalTask,
                                  presenter.personalTaskPercent);
                            }
                            if (categoryList![index]
                                    .categoryName!
                                    .compareTo('Business') ==
                                0) {
                              return CategoryItem(
                                  context,
                                  categoryList![index],
                                  index,
                                  presenter.businessTask,
                                  presenter.businessTaskPercent);
                            }

                            return CategoryItem(
                                context,
                                categoryList![index],
                                index,
                                presenter.workTask,
                                presenter.workTaskPercent);
                          },
                        );
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MARGIN_XLARGE,
                    left: MARGIN_MEDIUM_3,
                    right: MARGIN_MEDIUM_3,
                    bottom: MARGIN_MEDIUM_3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TODAY'S TASKS  ${presenter.tdyTaskCountGet} tasks ",
                      style:
                          TextStyle(color: blackLightColor, fontSize: TEXT_REGULAR),
                    ),
                     CircularProgressIndicator(
                    value: presenter.tdyJobDonePercentGet,
                    color: blueAccentColor,
                    backgroundColor: indicatorColor,
                  ),
                  ],
                ),
              ),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box box, widget) {
                  return ListView.builder(
                   
                      
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        TaskData data = box.getAt(index);

                        return data.dateTask!.trim().compareTo(currentDate) == 0
                            ? taskItem(context, data, index)
                            : Container();
                      });
                },
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.pushNamed(context, '/addNote');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
