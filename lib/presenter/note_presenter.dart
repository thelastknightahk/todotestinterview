import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/task_data.dart'; 
 
import 'package:todo/model/task.dart';

class NotePresenter extends ChangeNotifier {
  List<Task> taskList = [];  
  int _categoryAddColorIndex = 0;
  int _personalTaskCount = 0 ;
  double _personalTaskPercent = 0.0;
  int _businessTaskCount = 0;
  double _businessTaskPercent = 0.0;
  int _workTaskCount = 0;
  double _workTaskPercent = 0.0;
  double _jobDonePercent = 0.0;
  double _tdyDonePercent = 0.0;
  int _todayTaskCount = 0;
  String _grettingTxt = "";
  DateTime now =  DateTime.now();

  final Box box = Hive.box('todoApp');
  String _categoryAddName = 'Personal';
  String _categoryAddTask = '';
  String _categoryAddCalender = 'Today';
  String _categoryAddTime = 'Time';

  int _categoryUpdateColorIndex = 0;
  int _categoryItemUpdateIndex = 0;
  String _categoryUpdateName = 'Personal';
  String _categoryUpdateTask = '';
  String _categoryUpdateCalender = 'Today';
  String _categoryUpdateTime = '00:00';


  int get tdyTaskCountGet => _todayTaskCount;
  int get personalTask => _personalTaskCount;
  double get personalTaskPercent => _personalTaskPercent;
  int get businessTask => _businessTaskCount;
  double get businessTaskPercent => _businessTaskPercent;
  int get workTask => _workTaskCount;
  double get workTaskPercent => _workTaskPercent;
  double get jobDonePercentGet => _jobDonePercent ;
  double get tdyJobDonePercentGet => _tdyDonePercent ;
  String get greetingText => _grettingTxt;
 
  int get categoryAddColorIndex => _categoryAddColorIndex;
  
  String get categoryAddName => _categoryAddName;
  String get categoryAddCalender => _categoryAddCalender;
  String get categoryAddTime => _categoryAddTime;
  String get categoryTaskName => _categoryAddTask;

  int get categoryUpdateColorIndex => _categoryUpdateColorIndex;
  int get categoryUpdateItemIndex => _categoryItemUpdateIndex;
  String get categoryUpdateName => _categoryUpdateName;
  String get categoryUpdateCalender => _categoryUpdateCalender;
  String get categoryUpdateTime => _categoryUpdateTime;
  String get categoryUpdateTask => _categoryUpdateTask;
 
  Future taskDataGet () async{
  
      int todayTaskCountTotal = 0; int todayJobDoneCountTotal = 0;
      int personalCount = 0, businessCount = 0, workCount =0;
      int personalCountFinish =0, businessCountFinish = 0, workCountFinish = 0;
    
      String currentDate = "${now.day}-${now.month}-${now.year}";
     for(int i = 0 ; i< box.length; i++){
      TaskData taskData = box.getAt(i);
       
      
         if(taskData.categoryName!.compareTo('Personal') == 0){
         personalCount += 1;
         if(taskData.finishTask == true ){
           personalCountFinish += 1;
         }
         _personalTaskPercent = personalCountFinish/personalCount;
         _personalTaskCount = personalCount;
         
      }

      if(taskData.categoryName!.compareTo('Business') == 0){
         businessCount += 1;
         if(taskData.finishTask == true ){
           businessCountFinish += 1;
         }
         _businessTaskPercent = businessCountFinish/businessCount;
         _businessTaskCount = businessCount;
        
      }
      if(taskData.categoryName!.compareTo('Work') == 0){
         workCount += 1;
         if(taskData.finishTask == true ){
           workCountFinish += 1;
         }
         _workTaskPercent = workCountFinish / workCount;
         _workTaskCount = workCount;
         
      }

      if(taskData.dateTask!.trim().compareTo(currentDate) == 0){
         todayTaskCountTotal += 1;
          if(taskData.finishTask!){
           todayJobDoneCountTotal += 1;
         
           }
      }
     

      int allData = box.length;
      int jobDone = personalCountFinish + workCountFinish + businessCountFinish;
      _jobDonePercent = jobDone/allData;
      _todayTaskCount = todayTaskCountTotal;
      _tdyDonePercent = todayJobDoneCountTotal / todayTaskCountTotal;
    }

   
  var hour = DateTime.now().hour;
  if (hour < 12) {
    _grettingTxt = 'Have a Great Morning';
  }
  else if (hour < 17) {
    _grettingTxt = 'Have a Great Afternoon';
  } 
  else{
      _grettingTxt = 'Have a Nice Evening';
  }
 
    notifyListeners();
  }
   

  // add note presenter
  void categoryAddColorIndexSet(int index) {
    _categoryAddColorIndex = index;
    notifyListeners();
  }

  void categoryAddNameSet(String categoryName) {
    _categoryAddName = categoryName;
    notifyListeners();
  }
  

  void categoryAddTimeSet(String categoryTime) {
    _categoryAddTime = categoryTime;
    notifyListeners();
  }

  void categoryAddCalenderSet(String categoryCalender) {
    _categoryAddCalender = categoryCalender;
    notifyListeners();
  }

  void categoryAddTaskSet(String categoryTask) {
    _categoryAddTask = categoryTask;
    notifyListeners();
  }

  // update note presenter

  void categoryUpdateColorIndexSet(int index) {
    _categoryUpdateColorIndex = index;
    notifyListeners();
  }

  void categoryUpdateNameSet(String categoryName) {
    _categoryUpdateName = categoryName;
    notifyListeners();
  }

  void categoryUpdateTimeSet(String categoryTime) {
    _categoryUpdateTime = categoryTime;
    notifyListeners();
  }

  void categoryUpdateCalenderSet(String categoryCalender) {
    _categoryUpdateCalender = categoryCalender;
    notifyListeners();
  }

  void categoryUpdateTaskSet(String categoryTask) {
    _categoryUpdateTask = categoryTask;
    notifyListeners();
  }

  void categoryUpdateItemIndexSet(int indexUpdate) {
    _categoryItemUpdateIndex = indexUpdate;
    notifyListeners();
  }

  //get task data

  Future getTaskList() async {
    
    return taskList;
  }

  Future taskListSet(Task task) async {
   
    TaskData data = TaskData(categoryName: '${task.categoryName}',colorTaskIndex: task.colorTaskIndex  ,dateTask: '${task.dateTask }',finishTask: false,
    nameTask: '${task.nameTask }',timeTask: '${task.timeTask  }');
    box.add(data).then((value) => {}).catchError( (e) => {
      print("Same Data")
    });
     taskUpdateIndicatorCheck();
    notifyListeners();
  }

  // delete
  Future taskDeleteSet(int taskIndex) async {
 
     
    box.deleteAt(taskIndex);
     taskUpdateIndicatorCheck();
    notifyListeners();
  }

  // update
  Future taskUpdateSet() async {
    var task = TaskData(
        categoryName: _categoryUpdateName,
        colorTaskIndex: _categoryUpdateColorIndex,
        dateTask: _categoryUpdateCalender,
        finishTask: false,
        nameTask: _categoryUpdateTask,
        timeTask: _categoryUpdateTime);    
    box.putAt(categoryUpdateItemIndex,task);
     taskUpdateIndicatorCheck();
    notifyListeners();
  }

  // update
  Future taskUpdateSetCheck(TaskData taskData, bool finishBool,int index) async {
    var task = TaskData(
        categoryName: taskData.categoryName,
        colorTaskIndex: taskData.colorTaskIndex,
        dateTask: taskData.dateTask,
        finishTask: finishBool,
        nameTask: taskData.nameTask,
        timeTask: taskData.timeTask);
    
     
    box.putAt(index,task);
    taskUpdateIndicatorCheck();
    notifyListeners();
  }

  // update
  Future taskUpdateIndicatorCheck() async {
    
     int todayTaskCountTotal = 0;int todayJobDoneCountTotal = 0;
      int personalCount = 0, businessCount = 0, workCount =0;
      int personalCountFinish =0, businessCountFinish = 0, workCountFinish = 0;
      
      String currentDate = "${now.day}-${now.month}-${now.year}";
     for(int i = 0 ; i< box.length; i++){
      TaskData taskData = box.getAt(i);
       
      
         if(taskData.categoryName!.compareTo('Personal') == 0){
         personalCount += 1;
         if(taskData.finishTask == true ){
           personalCountFinish += 1;
         }
         _personalTaskPercent = personalCountFinish/personalCount;
         _personalTaskCount = personalCount;
         
      }

      if(taskData.categoryName!.compareTo('Business') == 0){
         businessCount += 1;
         if(taskData.finishTask == true ){
           businessCountFinish += 1;
         }
         _businessTaskPercent = businessCountFinish/businessCount;
         _businessTaskCount = businessCount;
        
      }
      if(taskData.categoryName!.compareTo('Work') == 0){
         workCount += 1;
         if(taskData.finishTask == true ){
           workCountFinish += 1;
         }
         _workTaskPercent = workCountFinish / workCount;
         _workTaskCount = workCount;
         
      }

      if(taskData.dateTask!.trim().compareTo(currentDate) == 0){
         todayTaskCountTotal += 1;
             if(taskData.finishTask!){
           todayJobDoneCountTotal += 1;
         
           }
      }

      int allData = box.length;
      int jobDone = personalCountFinish + workCountFinish + businessCountFinish;
      _jobDonePercent = jobDone/allData;
      _todayTaskCount = todayTaskCountTotal;
        _tdyDonePercent = todayJobDoneCountTotal / todayTaskCountTotal;
    }
 
  }

}
