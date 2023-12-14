import 'package:flutter/material.dart';
import 'package:todo/utility/my_button.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add your task here",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onpressed: () {}, text: "Cancel"),
                SizedBox(
                  width: 20.0,
                ),
                MyButton(onpressed: () {}, text: "Save")
              ],
            )
          ],
        ),
      ),
    );
  }
}
