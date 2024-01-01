import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/shared/http_request/http_services.dart';
import 'package:flutter_curd_with_api/shared/models/products.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier {


   bool _isUpdate = true;
   bool _isDelete = true;

  final List <Products> _products = [];

  List<Products> get products => _products;
  bool get isUpdate => _isUpdate;
  bool get isDelete => _isDelete;


  Future<void> getProducts()async{
    final response = await HttpServices.getData('/products');
    if(response.statusCode == 200){
      final List<dynamic> decodedData = jsonDecode(response.body);
      for (dynamic data in decodedData) {
        final jsonData = Products.fromJson(data);
        _products.add(jsonData);
         notifyListeners();
      }
    }

  }


  Future<Response> updateData(int id,Products products)async{
    _isUpdate = false;
    notifyListeners();
    final response = await HttpServices.putData('/products/$id',products);
    if(response.statusCode == 200){
      _isUpdate = true;
      notifyListeners();
      return response;
    }
    if(_isUpdate == false){
      Future.delayed(const Duration(seconds: 2),(){
        _isUpdate = true;
        notifyListeners();
      });
    }
    return response;

  }

  Future<Response> deleteData(int id)async{
    _isDelete = false;
    notifyListeners();
    final response = await HttpServices.deleteData('/products/$id');
    if(response.statusCode == 200){
      _isDelete = true;
      notifyListeners();
      return response;
    }
    if(_isDelete == false){
      Future.delayed(const Duration(seconds: 2),(){
        _isDelete = true;
        notifyListeners();
      });
    }
    return response;
  }

}