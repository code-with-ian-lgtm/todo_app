import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase db = ToDoDatabase();

  //reference the box
  final _myBox = Hive.box('To Do Box');


  @override
  void initState() {
    //first time opening the app create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //data already exists
      db.loadData();
    }
    super.initState();
  }

  final controller = TextEditingController();


  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      controller.clear();
    });
    db.updateDatabase();

  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          myController: controller,);
      });
      db.updateDatabase();
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
      child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index) {
          return ToDoTile(
            onChanged: (value) => checkBoxChanged(value, index), 
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1],
            deleteFunction: (context) => deleteTask(index),
            );
            
        }
        )
    );
  }
}