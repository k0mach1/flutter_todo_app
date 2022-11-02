import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTodoModal extends StatefulWidget {
  const AddTodoModal({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddTodoModalState();
  }
}

class AddTodoModalState extends State<AddTodoModal> {

  String _todo = '';

  void handleText(String todo) {
    setState(() {
      _todo = todo;
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
            onChanged: handleText,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context, _todo);
          }, child: const Text('Submit'))
        ],
      ),
    );
  }
  
}