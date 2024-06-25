import 'package:hive/hive.dart';

class ToDoDatabase {

  List toDoList = [];

  //reference hive
  final _mybox = Hive.box("To Do Box");

  //run this method if this is the first time ever opening this app
  void createInitialData(){
    toDoList = [
      ["Downloaded App",true]
    ];
  }

  //load the data from database
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }

  //update the database
  void updateDatabase (){
    _mybox.put("TODOLIST", toDoList);
  }


}