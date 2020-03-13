import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_crud/model/customer.dart';
import 'package:flutter_bloc_crud/resources/costumer_service.dart';

enum CustomerEvent { to_get, to_post, to_put, to_delete }

class CustomerBloc extends Bloc<CustomerEvent, Customer> {
  static Customer initialStateCustomer = Customer(id: "no id", name: "no name");
  @override
  Customer get initialState => initialStateCustomer;

  @override
  Stream<Customer> mapEventToState(CustomerEvent event) async* {
    print("pressed");
    yield (event == CustomerEvent.to_get)
        ? await CustomerService.getOne("1")
        : (event == CustomerEvent.to_post)
            ? await CustomerService.create("Jacto", "Dev")
            : (event == CustomerEvent.to_put)
                ? await CustomerService.update("morpheus", "zion resident")
                : await CustomerService.delete();
  }
}
