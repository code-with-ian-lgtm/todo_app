import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();

    void greetUser(){
      print(myController.text);
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your name"
                ),
              ),
              ElevatedButton(
                onPressed: greetUser, 
                child: Text("Tap"))
            ],
          ),
        )
        ),
    );
  }
}