import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chabad_tv/models/shabbat.dart';

class Requests {

  static Future getShabbatTimes() async {
    var path = 'shabbat/?cfg=json&geonameid=4682464&m=50';
    var result = await getResult(path);
    print("RES: " + result.toString());
    Shabbat shabbatInfo = Shabbat.fromJson(result);
    print(shabbatInfo.items.candleLighting);
    return shabbatInfo;
  }



  static Future getResult(String path) async {
    String requestUrl = 'https://www.hebcal.com/$path';
    var request = await HttpClient().getUrl(Uri.parse(requestUrl));
    var response = await request.close();
    var contents =
    await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }

}
