import "package:flutter/material.dart";
import "package:habitica_clone/views/home.dart";
import "../views/todo.dart";

class BottomNavBar extends StatefulWidget {
  void Function(int) onTapHandler;

  BottomNavBar({super.key, required this.onTapHandler});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        widget.onTapHandler(value);
        setState(() => index = value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: "Todos",
          activeIcon: Icon(
            Icons.checklist,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
