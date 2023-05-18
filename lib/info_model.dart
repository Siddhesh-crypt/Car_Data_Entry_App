class info{
  String? key;
  InfoData? infoData;

  info({this.key, this.infoData});
}

class InfoData{
  String? reading;
  String? fule_type;
  String? quantity;
  String? price;
  String? place;

  InfoData({this.reading,this.fule_type, this.quantity, this.price, this.place});

  InfoData.fromJson(Map<dynamic, dynamic> json){
    reading = json["reading"];
    fule_type = json["type"];
    quantity = json["quantity"];
    price = json["price"];
    place = json["place"];
  }
}