import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/shared/http_request/http_services.dart';
import 'package:flutter_curd_with_api/shared/models/post_model.dart';
import 'package:http/http.dart';

class PostProvider extends ChangeNotifier {

bool _isUploaded = true;

bool get isUploaded => _isUploaded;


   Future<Response> postData(PostModel postData)async{
    _isUploaded = false;
    notifyListeners();
    final response = await HttpServices.postData('/posts', postData);
    if(response.statusCode == 201){
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

}