import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_crud/model/customer.dart';
import 'package:flutter_bloc_crud/resources/costumer_service.dart';

part 'customer_event.dart';

class CustomerBloc extends Bloc<CustomerEvent, Customer> {
  static Customer initialStateCustomer = Customer(id: "no id", name: "no name");
  @override
  Customer get initialState => initialStateCustomer;

  @override
  Stream<Customer> mapEventToState(CustomerEvent event) async* {
    if (event is Get) {
      yield await CustomerService.getOne(event.id);
    } else if (event is Post) {
      yield await CustomerService.create(event.name, event.job);
    } else if (event is Put) {
      yield await CustomerService.update(event.firstName, event.lastName);
    } else if (event is Delete) {
      yield await CustomerService.delete();
    } else {
      yield Customers(await CustomerService.getAll());
    }
  }
}

class Customers extends Customer {
  List<Customer> customers;
  Customers(this.customers);
}
