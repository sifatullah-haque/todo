import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Data/database.dart';
import 'package:todo/utility/dialogue_box.dart';
import 'package:todo/utility/todo_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("myBox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value ?? false; // Ensure a default value if null
    });
    db.updateTodoList();
  }

  void onSave() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateTodoList();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: onSave,
          );
        });
  }

  void deleteList(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoListTile(
            taskName: db.toDoList[index][0],
            isValueChanged: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteList(index),
          );
        },
      ),
    );
  }
}
