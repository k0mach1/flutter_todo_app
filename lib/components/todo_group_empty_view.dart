import 'package:flutter/cupertino.dart';

class TodoGroupEmptyView extends StatelessWidget {
  const TodoGroupEmptyView({ super.key });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('images/todo_group_empty.png'),
          const Text('This Todo Group is Empty'),
        ],
      ),  
    );
  }

}