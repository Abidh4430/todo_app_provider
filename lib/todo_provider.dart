import 'package:flutter/material.dart';

class TodoProivder extends ChangeNotifier {
   List<Map<String, dynamic>> _taskList = [];
   List<Map<String, dynamic>> get taskList => _taskList;

void addtask(String? text){
  _taskList.add({'task':text,'isDone': false});
  notifyListeners();
}
void toggleTask(int index){
  _taskList[index]['isDone']=!_taskList[index]['isDone'];
  notifyListeners();
}

void removeTask(int index){
  _taskList.removeAt(index);
  notifyListeners();
}

}