import 'dart:convert';

import 'package:http/http.dart' as http;


class UserApiService
{
  Future<dynamic>SendUserLogin(String email,String password)async
  {
    var client=http.Client();
    var apiurl=Uri.parse("http://10.0.16.157:3002/api/users/signin");
    var response=await client.post(apiurl,
        headers: <String,String>{
          "Content-Type":"application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "email":email,
          "password":password
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to Login");
    }
  }
}