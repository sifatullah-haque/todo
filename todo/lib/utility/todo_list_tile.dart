import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListTile extends StatelessWidget {
  final Function(bool?)? onChanged;
  final bool isValueChanged;
  final String taskName;
  Function(BuildContext)? deleteFunction;

  TodoListTile({
    Key? key,
    required this.taskName,
    required this.isValueChanged,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(15.0),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.yellow[200],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: isValueChanged,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // Task name
              Text(
                taskName,
                style: isValueChanged
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : TextStyle(decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
