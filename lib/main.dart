import 'package:flutter/material.dart';
import 'package:todo/widgets/counter.dart';
import 'package:todo/widgets/todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Todo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);
  @override
  State<Todo> createState() => _TodoState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoState extends State<Todo> {
  List<Task> tasks = [
    Task(title: "Gym", status: false),
    Task(title: "eat", status: true),
  ];
  // to removetodo when clicking on delete icon

  delete(int clicked){
    setState(() {
      tasks.remove(tasks[clicked]);
    });
  }
// to remove alltodos when clicking on delete icon
  deleteAll(){
   setState(() {
     tasks.removeRange(0, tasks.length);
   });
  }
//to change the status of thetodo (completed or not) when click on thetodo
  changeStatus(int taskIndex){
   setState(() {
     tasks[taskIndex].status = !tasks[taskIndex].status;
   });
  }
//to add newtodo when clicking on add icon
  addnewtask() {
    setState(() {
      tasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }
//create controller to get text inside textfield in the dialog widget
  final myController = TextEditingController();

  //to calculate only completed todos
  int calculateCompletedTasks() {
    int completedTasks = 0;

    tasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });
    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //el dialog ell hya widget bttl3 n add feha task gded
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  color: Colors.amber[100],
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        maxLength: 20,
                        controller: myController,
                        decoration:
                            const InputDecoration(labelText: "Add new task"),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          addnewtask();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(onPressed:
              (){
                deleteAll();
              },
            icon:const Icon(Icons.delete_forever),
          iconSize: 37,
          color:const Color.fromARGB(255, 255, 188, 214),

          )
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        title: const Text(
          "Todo App",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

              Container(
                margin:const EdgeInsets.only(top: 22),
                height: 500,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                      //i will pass all these information when create the todocard in todocard.dart()

                      vartitle: tasks[index].title,
                      doneornot: tasks[index].status,
                      myfunc: changeStatus,
                      iii: index,
                        delete: delete
                    );
                  },
                ),
              ),
            SizedBox(
              height: double.infinity,
              child: Counter(
                  allTodos: tasks.length,
                  allCompleted: calculateCompletedTasks()),
            )
          ],
        ),
      ),
    );
  }
}
