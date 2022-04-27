import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/components.dart';
import 'package:todo_bloc/models/todos_model.dart';

import 'blocs/todos/todos_bloc.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC Pattern : Add a To Do'),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo Add'),
              ),
            );
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _inputField('ID', controllerId),
                _inputField('Task', controllerTask),
                _inputField('Description', controllerDescription),
                ElevatedButton(
                  onPressed: () {
                    var todo = Todo(
                      id: controllerId.text,
                      task: controllerTask.text,
                      description: controllerDescription.text,
                    );
                    context.read<TodosBloc>().add(
                          AddTodo(todo: todo),
                        );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  child: const Text('Add To Do'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _inputField(String field, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field: ',
          style: kTextStyle,
        ),
        Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            child: TextFormField(
              controller: controller,
            ))
      ],
    );
  }
}
