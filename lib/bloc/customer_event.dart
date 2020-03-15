part of 'customer_bloc.dart';

abstract class CustomerEvent {
  final String id;
  final String name;
  final String job;
  final String firstName;
  final String lastName;
  CustomerEvent({this.id, this.name, this.job, this.firstName, this.lastName});
}

class Get extends CustomerEvent{
 Get(String id) : super(id: id);
}

class Post extends CustomerEvent{
  final String name;
  final String job;

 Post({this.name, this.job}) : super(name: name, job:job);
}

class Put extends CustomerEvent{
  final String firstName;
  final String lastName;

 Put({this.firstName, this.lastName}) : super(firstName: firstName, lastName: lastName);
}

class Delete extends CustomerEvent{
 Delete() : super();
}

class GetAll extends CustomerEvent{
 GetAll() : super();
}
