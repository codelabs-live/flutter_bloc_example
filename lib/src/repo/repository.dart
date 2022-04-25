
import 'package:flutter_bloc_example/src/model/employee_model.dart';
import 'package:flutter_bloc_example/src/repo/provider.dart';

class Repository{
  final _provider= Provider();

  Future<EmployeeModel> fetchEmployee(){
    return _provider.fetchEmployee();
  }

}


class NetworkError extends Error{}