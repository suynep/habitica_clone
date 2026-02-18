import "package:flutter/material.dart";
import "package:habitica_clone/views/todo.dart";

class HabiticaHome extends StatelessWidget {
  const HabiticaHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Habitica",
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),

      body: TodoView(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Todos"),
        ],
      ),
    );
  }
}

class Analytica extends StatelessWidget {
  const Analytica({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
