import 'package:flutter/material.dart';

import 'form.dart';
import 'main.dart';
import 'models/budget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, this.data});

  final List<Budget>? data;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Budget"),
      ),
      drawer: Drawer(
        child: Column(children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ListScreen()),
              );
            },
          ),
        ]),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          if (widget.data != null) ...[
            for (var i = 0; i < widget.data!.length; i++) ...[
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Column(
                  children: <Widget>[
                    // ignore: unnecessary_new
                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(children: <Widget>[
                          Text(
                            widget.data![i].judul,
                            style: TextStyle(fontSize: 24),
                          )
                        ]),
                      ),
                    ),
                    // ignore: unnecessary_new
                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.data![i].nominal.toString()),
                            Text(widget.data![i].tipeBudget),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
          ]
        ]),
      ),
    );
  }
}
