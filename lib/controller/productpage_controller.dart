import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luminartest/model/singleproduct_model.dart';
import 'package:http/http.dart' as http;

class ProductpageController with ChangeNotifier {
  bool isloading = false;
  Singleproductmodel? productobj;
  Future<void> fetchproduct({required int id}) async {
    isloading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse("https://api.restful-api.dev/objects/$id"));
    if (response.statusCode == 200) {
      var product = json.decode(response.body);
      productobj = Singleproductmodel.fromJson(product);
      notifyListeners();
    } else {
      isloading = false;
      notifyListeners();
      print("failed to load");
    }
  }
}
