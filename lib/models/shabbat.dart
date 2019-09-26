class Shabbat {
  final ShabbatItem items;
  final ShabbatDetails details;

  Shabbat(this.items, this.details);

  factory Shabbat.fromJson(Map<String, dynamic> json) {
    return new Shabbat(new ShabbatItem.fromJson(json["items"]),
        new ShabbatDetails.fromJson(json));
  }
}

class ShabbatDetails {
  final String location;

  final String reqDate;

  ShabbatDetails(this.location, this.reqDate);

  factory ShabbatDetails.fromJson(Map<String, dynamic> json) {
    return new ShabbatDetails(
      json["title"],
      json["date"],
    );
  }
}

class ShabbatItem {
  final String candleLighting;
  final String shabbatDate;
  final String hebrew;

  ShabbatItem(this.candleLighting, this.shabbatDate, this.hebrew);

  factory ShabbatItem.fromJson(List<dynamic> json) {
    String canLight;
    String shabDate;
    String heb;
    for (Map map in json) {
      if (map["category"] != null && map["category"] == "candles") {
        print(map["hebrew"]);
        canLight = map["title"];
        shabDate = map["date"];
        heb = map["hebrew"];
      }
    }

    return new ShabbatItem(canLight, shabDate, heb);
  }
}
