import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  Function(bool?)? onChanged;
  final bool isValueChanged;
  final String taskName;
  TodoListTile({
    super.key,
    required this.taskName,
    required this.isValueChanged,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: isValueChanged,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),

            //task name
            Text(taskName,
                style: isValueChanged
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : TextStyle(decoration: TextDecoration.none)),
          ],
        ),
      ),
    );
  }
}
