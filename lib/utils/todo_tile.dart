// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({super.key,
  required this.onChanged,
  required this.taskName,
  required this.taskCompleted,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25,left: 25,right: 25),
      child: Slidable(
        
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
            ),
            
          ]),
        child: Container(
          padding:const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
          ),
          child:  Row(
            children: [
              //check box
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted? TextDecoration.lineThrough: TextDecoration.none
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}