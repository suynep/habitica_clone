import "package:flutter/material.dart";
import "package:habitica_clone/views/todo.dart";
import "../components/navigation_bar.dart";

class HabiticaHome extends StatefulWidget {
  const HabiticaHome({super.key});

  State<HabiticaHome> createState() => _HabiticaHomeState();
}

class _HabiticaHomeState extends State<HabiticaHome> {
  int index = 0;
  static List<Widget> navigationViews = [HomeView(), TodoView()];
  Widget currentView = Container();

  void onTapHandler(int value) {
    setState(() {
      index = value;
      currentView = navigationViews[index];
    });
  }

  @override
  void initState() {
    super.initState();
    currentView = navigationViews[index];
  }

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
      bottomNavigationBar: BottomNavBar(onTapHandler: onTapHandler),
      body: currentView,
      floatingActionButton: ElevatedButton(
        onPressed: () => {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add, size: 48),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Home Shi")));
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
