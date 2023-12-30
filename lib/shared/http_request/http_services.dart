import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {

  static const String _baseURL = 'https://jsonplaceholder.typicode.com';

 static Future<void> postData(String url, Map<String,dynamic> body)async{
    //const url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.post(
      Uri.parse(_baseURL+url),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8',}
    );
    if(response.statusCode == 201){
      print(response.body);
    }else{
      print(response.statusCode);
    }
  }


}