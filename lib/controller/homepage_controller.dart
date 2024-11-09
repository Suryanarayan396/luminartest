import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:luminartest/model/allproductmodel_model.dart';
import 'package:http/http.dart' as http;

class HomepageController with ChangeNotifier {
  List<Allproductmodel> _allproducts = [];
  List<Allproductmodel> get allproducts => _allproducts;
  // bool isloading = false;
  // Singleproductmodel? productobj;

  Future<void> fetchallproducts() async {
    final response =
        await http.get(Uri.parse("https://api.restful-api.dev/objects"));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      _allproducts =
          products.map((json) => Allproductmodel.fromJson(json)).toList();
      notifyListeners();
    } else {
      print("failed to load");
    }
  }

  // Future<void> fetchproduct({required int id}) async {
  //   isloading = true;
  //   notifyListeners();
  //   final response =
  //       await http.get(Uri.parse("https://api.restful-api.dev/objects/$id"));
  //   if (response.statusCode == 200) {
  //     var product = json.decode(response.body);
  //     productobj = Singleproductmodel.fromJson(product);
  //     notifyListeners();
  //   } else {
  //     isloading = false;
  //     notifyListeners();
  //     print("failed to load");
  //   }
  // }
}
