import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Requests {

  static Future<List<Stop>> getLineStops(String line) async {
    var path = "/api/route/$line/stops";
    var result = await getResult(path);
    var lineStopList = (result).map((i) => Stop.fromJson(i)).toList();
    return lineStopList;
  }



  static Future<List<dynamic>> getResult(String path) async {
    String requestUrl = 'http://transport.tamu.edu/BusRoutesFeed$path';
    var request = await HttpClient().getUrl(Uri.parse(requestUrl));
    var response = await request.close();
    var contents =
    await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }

}
