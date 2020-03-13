import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_crud/bloc/customer_bloc.dart';
import 'package:flutter_bloc_crud/common/route_name_constant.dart';
import 'package:flutter_bloc_crud/model/customer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomerScreen extends StatelessWidget {
  static final routeName = RouteNameConstant.customerScreen;
  @override
  Widget build(BuildContext context) {
    CustomerBloc customerBloc = BlocProvider.of<CustomerBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              customerBloc.add(CustomerEvent.to_get);
              Fluttertoast.showToast(
                  msg: "Getted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
            child: Text("Get"),
            backgroundColor: Colors.blueAccent,
          ),
          FloatingActionButton(
            onPressed: () {
              customerBloc.add(CustomerEvent.to_post);
              Fluttertoast.showToast(
                  msg: "Created",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
            child: Text("Post"),
            backgroundColor: Colors.green,
          ),
          FloatingActionButton(
            onPressed: () {
              customerBloc.add(CustomerEvent.to_put);
              Fluttertoast.showToast(
                  msg: "Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.amber,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
            child: Text("Put"),
            backgroundColor: Colors.amber,
          ),
          FloatingActionButton(
            onPressed: () {
              customerBloc.add(CustomerEvent.to_delete);
              Fluttertoast.showToast(
                  msg: "Deleted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
            child: Text("Delete"),
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Http Req"),
        backgroundColor: Colors.purple,
        elevation: 15.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CustomerBloc, Customer>(
              builder: (context, customer) => Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 15.0,
                color: Colors.cyan,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Center(
                      child: Text(
                          (customer != CustomerBloc.initialStateCustomer)
                              ? "Id : " +
                                  customer.id +
                                  "\n" +
                                  "Name : " +
                                  customer.name
                              : "Press any button"),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
