import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/GetBeautyDataModel.dart';

class GetProductData{

  static Future<List<GetBeutyDataModel?>?> getproductdetails() async {
    http.Response response = await http.get(Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    return getBeutyDataModelFromJson(response.body);
  }

}