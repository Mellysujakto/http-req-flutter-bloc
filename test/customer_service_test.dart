import 'package:flutter_bloc_crud/model/customer.dart';
import 'package:flutter_bloc_crud/resources/costumer_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock with http.Client {}

void main() {
  http.Client client = MockClient();

  String getOneURL = "https://reqres.in/api/users/";
  String postURL = "https://reqres.in/api/users";
  String putURL = "https://reqres.in/api/users/2";
  String deleteURL = "https://reqres.in/api/users/2";
  
  group("Customer Service Test", () {
    test("getOne test", () async {
      String id = "1";
      Customer expected = Customer(id: "1", name: "GeorgeBluth");
      when(client.get(getOneURL + id)).thenAnswer(
          (_) async => Future.value(http.Response('''expected''', 200)));
      Customer actual = await CustomerService.getOne(id);
      expect(actual, equals(expected));
    });
    test("create test", () async {
      String name = "jacto";
      String job = " new owner";
      when(client.post(postURL)).thenAnswer(
          (_) async => Future.value(http.Response('''name''', 200)));
      Customer actual = await CustomerService.create(name, job);
      expect(actual.name, equals(name));
    });
    test("update test", () async {
      String name = "jacto";
      String job = " new owner";
      when(client.put(putURL)).thenAnswer(
          (_) async => Future.value(http.Response('''name''', 200)));
      Customer actual = await CustomerService.update(name, job);
      expect(actual.name, equals(name));
    });
    test("delete test", () async {
      String expected = "JanetWeaver";
      when(client.delete(deleteURL)).thenAnswer(
          (_) async => Future.value(http.Response('''expected''', 200)));
      Customer actual = await CustomerService.delete();
      expect(actual.name, equals(expected));
    });
  });
}
