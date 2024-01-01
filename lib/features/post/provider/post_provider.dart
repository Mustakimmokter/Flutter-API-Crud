import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/shared/http_request/http_services.dart';
import 'package:flutter_curd_with_api/shared/models/products.dart';
import 'package:http/http.dart';

class PostProvider extends ChangeNotifier {

bool _isUploaded = true;
bool _isEmptyTitle = false;
bool _isEmptyDes = false;

bool get isUploaded => _isUploaded;
bool get isEmptyTitle => _isEmptyTitle;
bool get isEmptyDes => _isEmptyDes;


   Future<Response> postData(Products postData)async{
    _isUploaded = false;
    notifyListeners();
    final response = await HttpServices.postData('/products', postData);
    if(response.statusCode == 200){
      _isUploaded = true;
      notifyListeners();
      return response;
    }
    if(_isUploaded == false){
      Future.delayed(const Duration(seconds: 2),(){
        _isUploaded = true;
        notifyListeners();
      });
    }
    return response;
  }


  void textFieldEmptyError(String title, String description){
    if(title.isEmpty){
      _isEmptyTitle = true;
      notifyListeners();
      Future.delayed(const Duration(seconds: 1),(){
        _isEmptyTitle = false;
        notifyListeners();
      });
    }else if(description.isEmpty){
      _isEmptyDes = true;
      notifyListeners();
      Future.delayed(const Duration(seconds: 1),(){
        _isEmptyDes = false;
        notifyListeners();
      });
    }
  }

}