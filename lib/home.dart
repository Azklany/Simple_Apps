// import 'package:app_one/screen2.dart';
// import 'package:app_one/scrren1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int index = 0;
  List<Widget> pages = [
    const Scaffold(
      body: Center(child: Text("Screeeen 1")),
    ),
    const Scaffold(
      body: Center(child: Text("Screeeen 2")),
    )
  ];
  DateTime? date;
  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/x2");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Part 1"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Part 2")
          ],
        ),
        drawerScrimColor: Colors.amber.withOpacity(.2),
        drawer: Drawer(
          backgroundColor: Colors.amber.withOpacity(.6),
          child: ListView(
            children: [
              ListTile(
                title: const Text("Screen 1"),
                onTap: () {
                  Navigator.of(context).pushNamed("/x1");
                },
                subtitle: const Text("subtitle"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  selectScreen(context);
                },
                title: const Text("Screen 2"),
              ),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(2020, 5, 1),
                        firstDate: DateTime(2018, 5, 1),
                        lastDate: DateTime.now(),
                      ).then((val) {
                        setState(() {
                          date = val;
                        });
                      });
                    });
                  },
                  child: const Text("Click")),
              // const Text("$date"),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.amber,
        ),
        body: pages[index],
      ),
    );
  }
}
