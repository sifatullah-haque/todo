import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box("myBox");
  //first time ever opened the app

  void createInitialData() {
    toDoList = [
      ["Click on the left button to \n mark as complete", false],
      ["Click on the + button to add task", false],
      ["Swap Left to delete Task", false]
    ];
  }

  //the app has been open before
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the app
  void updateTodoList() {
    _myBox.put("TODOLIST", toDoList);
  }
}
