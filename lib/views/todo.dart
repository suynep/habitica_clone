import "package:flutter/material.dart";
import "package:habitica_clone/config.dart";
import "package:habitica_clone/mock/mock.dart";

class TodoView extends StatefulWidget {
  TodoView({super.key});
  final int todoCount = 50;

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List<TodoItem> todoSide = [];
  List<TodoItem> doneSide = [];
  List<TodoItem> todoItems = [];

  void changeRows(TodoItem item) {
    setState(() {
      todoSide = [];
      doneSide = [];

      for (var e in todoItems) {
        if (!e.isChecked) {
          todoSide.add(e);
        } else {
          doneSide.add(e);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    todoItems = getMockTodos(widget.todoCount).map((e) {
      return TodoItem(
        title: e["title"],
        description: e["description"],
        changeRows: changeRows,
      );
    }).toList();

    for (var e in todoItems) {
      if (!e.isChecked) {
        todoSide.add(e);
      } else {
        doneSide.add(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Flexible(child: ListView(children: [...todoSide])),
        SizedBox(width: 10),
        Flexible(child: ListView(children: [...doneSide])),
        SizedBox(width: 10),
      ],
    );
  }
}

class TodoItem extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  bool isChecked;
  Function(TodoItem) changeRows;

  TodoItem({
    super.key,
    required this.title,
    required this.description,
    this.color = Colors.white70,
    this.isChecked = false,
    required this.changeRows,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void tapHandler() {
    setState(() {
      widget.isChecked = !widget.isChecked;
      widget.changeRows(widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        GestureDetector(
          onTap: tapHandler,
          child: Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12),
              color: !widget.isChecked ? widget.color : Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // title
                  Text(
                    widget.title,
                    style: !widget.isChecked
                        ? getGlobalFont(16, Theme.of(context).primaryColor)
                        : getGlobalFont(
                            16,
                            Theme.of(context).secondaryHeaderColor,
                          ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // description body
                  Text(
                    widget.description,
                    style: !widget.isChecked
                        ? getGlobalFont(12, Theme.of(context).primaryColor)
                        : getGlobalFont(
                            12,
                            Theme.of(context).secondaryHeaderColor,
                          ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
