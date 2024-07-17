class Valyuta {
  String name;
  double price;
  String code;
  Valyuta({
    required this.name,
    required this.price,
    required this.code,
  });

  factory Valyuta.fromJson(Map<String, dynamic> json) {
    return Valyuta(
        name: json["title"],
        price: double.parse(json["cb_price"]),
        code: json["code"]);
  }

  Map<String, dynamic> toJson() {
    return {"title": name, "code": code, "cb_price": price};
  }
}
