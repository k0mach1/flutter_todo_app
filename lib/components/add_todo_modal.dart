import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/models/todo.dart';

class AddTodoModal extends StatefulWidget {
  const AddTodoModal({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddTodoModalState();
  }
}

class AddTodoModalState extends State<AddTodoModal> {

  final Todo _todo = Todo.createEmpty();
  bool _isDescriptionEditable = false;

  void handleTitle(String title) {
    setState(() {
      _todo.title = title;
    });
  }

  void handleDescription(String description) {
    setState(() {
      _todo.description = description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            enabled: true,
            maxLength: 20,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLines: 1,
            decoration: const InputDecoration(
              icon: Icon(Icons.check),
              hintText: 'Input new TODO',
            ),
            onChanged: handleTitle,
          ),
          Visibility(
              visible: isTodoDeadlineEdited(),
              child: Text('Deadline: ${_todo.getDeadlineString()}')
          ),
          Visibility(
              visible: _isDescriptionEditable,
              child: TextFormField(
                initialValue: _todo.description,
                enabled: true,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'memo',
                ),
                onChanged: handleDescription,
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  DateTime now = DateTime.now();
                  final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _todo.deadline,
                      firstDate: now,
                      lastDate: DateTime(now.year + 1));
                  if (pickedDate != null) {
                    setState(() {
                      _todo.deadline = pickedDate;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_month),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isDescriptionEditable = !_isDescriptionEditable;
                  });
                },
                icon: const Icon(Icons.edit_note),
              )
            ],
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context, _todo);
          }, child: const Text('Submit'))
        ],
      ),
    );
  }

  bool isTodoDeadlineEdited() {
    return !(_todo.deadline == Todo.defaultDeadline());
  }
}