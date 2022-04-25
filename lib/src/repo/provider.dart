
import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_state.dart';
import 'package:flutter_bloc_example/src/model/employee_model.dart';

class Provider {

  Dio _dio = Dio();
  String BASE_URL = "http://dummy.restapiexample.com/api/v1/";
  Future<EmployeeModel> fetchEmployee() async{
      try {
        Response response = await _dio.get(BASE_URL + 'employee/2');
        return EmployeeModel.fromJson(response.data);
      } catch (error, stacktrace){
        return EmployeeModel.withError(error.toString());
      }
  }
}