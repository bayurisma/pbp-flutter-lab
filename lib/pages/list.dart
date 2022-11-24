import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../models/budget.dart';

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
      drawer: const DrawerList(),
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
