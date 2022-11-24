import 'dart:convert';
import 'package:counter_7/models/my_watch_list.dart';
import 'package:http/http.dart' as http;

List<MyWatchList> watchlist = [];

Future<List<MyWatchList>> fetchWatchlist() async {
  watchlist.clear();
  var url =
      Uri.parse('https://tugas-2-project.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  for (var d in data) {
    if (d != null) {
      watchlist.add(MyWatchList.fromJson(d));
    }
  }

  return watchlist;
}
