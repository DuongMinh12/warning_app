import 'package:warning_app/models/customer_model.dart';

abstract class BaseCustomerRepository{
  Stream<List<Customer>> getAllCustomer();
}

class CustomerRepository extends BaseCustomerRepository{


  @override
  Stream<List<Customer>> getAllCustomer() {
    throw UnimplementedError();
  }

}