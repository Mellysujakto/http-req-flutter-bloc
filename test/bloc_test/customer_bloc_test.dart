import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_crud/bloc/customer_bloc.dart';
import 'package:flutter_bloc_crud/model/customer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock with http.Client {}

void main() {
  group("Customer Bloc Test", () {
    blocTest("Initial Customer", build: () async => CustomerBloc(), expect: []);
    blocTest("to_get event",
        build: () async => CustomerBloc(),
        act: (bloc) async => {bloc.add(CustomerEvent.to_get)},
        expect: [Customer(id: "1", name: "GeorgeBluth")]);
    blocTest("to_post event",
        build: () async => CustomerBloc(),
        act: (bloc) async => {bloc.add(CustomerEvent.to_post)},
        expect: [Customer(id: "4", name: "Jacto")]);
    blocTest("to_put event",
        build: () async => CustomerBloc(),
        act: (bloc) async => {bloc.add(CustomerEvent.to_put)},
        expect: [Customer(id: "3", name: "morpheus")]);
    blocTest("to_delete event",
        build: () async => CustomerBloc(),
        act: (bloc) async => {bloc.add(CustomerEvent.to_delete)},
        expect: [Customer(id: "2", name: "JanetWeaver")]);
  });
}
