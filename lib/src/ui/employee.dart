import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_event.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_state.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void initState() {
    _employeeBloc.add(GetEmployee());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _employeeBloc,
      child: BlocListener<EmployeeBloc, EmployeeState>(
        listener: (BuildContext context, state) {
          if (state is EmployeeError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: const Text("No Data Found")));
          }
        },
        child: BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
          if (state is EmployeeInitial) {
            return Container();
          } else if (state is EmployeeLoading) {
            return Container();
          } else if (state is EmployeeLoaded) {
            return Scaffold(body: Center(
              child: Text(state.employeeModel.data!.employeeName.toString()),
            ));
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
