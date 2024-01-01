import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpServices {

  static const String _baseURL = 'https://fakestoreapi.com';

 static Future<Response> postData(String url, dynamic body)async{
    try{
      http.Response response = await http.post(
          Uri.parse(_baseURL+url),
          body: jsonEncode(body),
          headers: {'Content-type': 'application/json; charset=UTF-8',},
      );
      print(response.statusCode);
     return response;

    }catch(error){
      return http.Response(body, 501);
    }
  }

  static Future<Response> getData(String url)async{
   try{
     http.Response response = await http.get(
       Uri.parse(_baseURL+url),
       headers: {'Content-type': 'application/json; charset=UTF-8'},
     );
     return response;
   } catch (error){
     final body = {'title': 'Not found data'};
     return Response(jsonEncode(body), 501);
   }
  }

  static Future<Response> putData(String url,dynamic body)async{
   try{
     final http.Response response = await http.put(
         Uri.parse(_baseURL+url),
         body: jsonEncode(body),
         headers: {'Content-type': 'application/json; charset=UTF-8'}
     );
     print(response.statusCode);
     return response;
   }catch (error){
     final eBody = {'title': 'Not found data'};
     return Response(jsonEncode(eBody), 501);
   }
  }

  static Future<Response> deleteData(String url)async{
   try{
     final http.Response response = await http.delete(
         Uri.parse(_baseURL+url),
         headers: {'Content-type':'application/json; charset=UTF-8'}
     );
     return response;
   }catch(error){
     final body = {'title': 'Not found data'};
     return Response(jsonEncode(body), 501);
   }
  }


}