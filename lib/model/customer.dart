class Customer {
  String id;
  String name;

  Customer({this.id, this.name});

  factory Customer.createObject(Map<String, dynamic> object) {
    return Customer(
        id: object['id'].toString(),
        name: object['first_name'] + '' + object['last_name']);
  }
  factory Customer.createObjectForPost(Map<String, dynamic> object) {
    return Customer(
        id: object['id'],
        name: object['name']);
  }
  factory Customer.createObjectForPut(Map<String, dynamic> object) {
    return Customer(
        id: "3",
        name: object['name']);
  }
}
