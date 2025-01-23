import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['web app', false],
    ['android dev', true],
    ['Go spot', true],
    ['Turu', true],
  ];

  void cekCheckbox(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void simpanTodoBaru() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void hapusTodo(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length, 
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            tugasSelesai: toDoList[index][1],
            removeChecklist: (value) => cekCheckbox(index),
            deleteFunction: (context) => hapusTodo(index),
          );
      }),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new todo items',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple
                      ),
                      borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple
                      ),
                      borderRadius: BorderRadius.circular(15),
                  )
                )
              ),
            )
            ),
          FloatingActionButton(
            onPressed: simpanTodoBaru,
            child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}
