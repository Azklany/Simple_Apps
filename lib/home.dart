import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  DateTime? date;
  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/x2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
