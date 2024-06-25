// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final myController;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
    super.key,
    required this.myController,
    required this.onCancel,
    required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new Task",
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                  onPressed: onSave, 
                  text: "Save"),
                  const SizedBox(width: 8,),

                //cancel button
                MyButton(
                  onPressed: onCancel, 
                  text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}