import 'package:counter_7/widgets/drawer.dart';
import 'package:counter_7/pages/watchlist_detail.dart';
import 'package:counter_7/utils/fetch_watchlist.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: const DrawerList(),
      body: FutureBuilder(
        future: fetchWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'Tidak ada watchlist',
                    style: TextStyle(color: Color(0xff59A5D8)),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: snapshot.data![index].fields.watched
                                  ? Colors.green
                                  : Colors.red,
                              blurRadius: 2)
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WatchlistDetail(
                                    watchlist: snapshot.data![index])));
                      },
                      child: Row(
                        children: [
                          Checkbox(
                              value: snapshot.data![index].fields.watched,
                              onChanged: (bool? value) {
                                setState(() {
                                  snapshot.data![index].fields.watched = value!;
                                });
                              }),
                          Text(
                            "${snapshot.data![index].fields.title}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            }
          }
        },
      ),
    );
  }
}
