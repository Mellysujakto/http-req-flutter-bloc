import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_crud/model/customer.dart';

class CustomerService {
  static Future<Customer> getOne(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userDate = (jsonObject as Map<String, dynamic>)['data'];
    print(userDate.toString());
    return Customer.createObject(userDate);
  }

  static Future<Customer> create(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);

    return Customer.createObjectForPost(jsonObject);
  }

  static Future<Customer> update(String name, String job) async {
    String apiURL = "https://reqres.in/api/users/2";

    var apiResult = await http.put(apiURL, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);

    return Customer.createObjectForPut(jsonObject);
  }

  static Future<Customer> delete() async {
    String apiURL = "https://reqres.in/api/users/2";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userDate = (jsonObject as Map<String, dynamic>)['data'];
    print(userDate.toString());
    return Customer.createObject(userDate);
  }
}
