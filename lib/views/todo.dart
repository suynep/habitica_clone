import "package:flutter/material.dart";
import "package:habitica_clone/config.dart";
import "package:habitica_clone/mock/mock.dart";

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  var todoItems = getMockTodos(
    50,
  ).map((e) => TodoItem(title: e["title"], description: e["description"]));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Flexible(child: ListView(children: [...todoItems])),
        SizedBox(width: 10),
        Flexible(child: ListView(children: [...todoItems])),
        SizedBox(width: 10),
      ],
    );
  }
}

class TodoItem extends StatelessWidget {
  final String title;
  final String description;

  const TodoItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // title
          Text(
            title,
            style: getGlobalFont(16, Theme.of(context).primaryColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // description body
          Text(
            title,
            style: getGlobalFont(12, Theme.of(context).primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
