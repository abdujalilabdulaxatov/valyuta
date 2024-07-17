import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valyuta_calculator/data/models/valyuta.dart';

class GetServicesValyuta {
  Future<List<Valyuta>> getValyuta() async {
    Uri url = Uri.parse("https://nbu.uz/en/exchange-rates/json/");
    var response = await http.get(url);
    List<Map<String, dynamic>> data =
        jsonDecode(response.body).cast<Map<String, dynamic>>();
    if (response.statusCode == 200) {
      List<Valyuta> lst = data.map((json) => Valyuta.fromJson(json)).toList();
      print(lst);
      return lst;
    }
    return [];
  }
}
