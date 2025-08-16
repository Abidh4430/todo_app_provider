import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController taskcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo App"),backgroundColor: Colors.blue),
      body: Consumer(builder: (context,todoProvider,child){
        return todoProvider.taskList.isEmpty?
        Center(child: Text("No Tasks added yet")):
        ListView.builder(itemBuilder: (context,index){
          return ListTile(
            leading: Checkbox(value: todoProvider.taskList[index]['isDone'], onChanged: (value){
              todoProvider.toggleTask(index);
            }),
            title: Text(todoProvider.taskList[index]['task'],
            style: TextStyle(decoration: todoProvider.taskList[index]['isDone']
            ? TextDecoration.lineThrough : TextDecoration.none),

            ),
            trailing: IconButton(onPressed: (){
              todoProvider.removeTask(index);
            }, icon: Icon(Icons.delete)),
          );
        }
        );
      }),
      
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: taskcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Enter task",
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(taskcontroller.text.isNotEmpty){
                              Provider.of<TodoProivder>(context,listen: false)
                              .addtask(taskcontroller.text);
                            }
                            taskcontroller.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Add"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        )]),
                  ],
                ));
            },
          );
        },
    ),
    );
    
  }
}