

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/src/model/employee_model.dart';

abstract class EmployeeState  extends Equatable{
  const EmployeeState();
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState{}

class EmployeeLoading extends EmployeeState{}

class EmployeeLoaded extends EmployeeState{
  final EmployeeModel employeeModel;
  EmployeeLoaded(this.employeeModel);

}

class EmployeeError extends EmployeeState{
  final String? message;
  EmployeeError(this.message);
}