import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpServices {

  static const String _baseURL = 'https://jsonplaceholder.typicode.com';

 static Future<Response> postData(String url, dynamic body)async{
    try{
      http.Response response = await http.post(
          Uri.parse(_baseURL+url),
          body: jsonEncode(body),
          headers: {'Content-type': 'application/json; charset=UTF-8',},
      );

     return response;

    }catch(error){
      return http.Response(body, 501);
    }
  }

  static Future<dynamic> getData(String url)async{
   http.Response response = await http.get(
       Uri.parse(_baseURL+url),
     headers: {'Content-type': 'application/json; charset=UTF-8'},
   );

   if(response.statusCode == 200){
     final deCodedData = jsonDecode(response.body);
     print(deCodedData);
   }
  }


}