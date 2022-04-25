import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_event.dart';
import 'package:flutter_bloc_example/src/bloc/employee/employee_state.dart';
import 'package:flutter_bloc_example/src/repo/repository.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    final Repository repository = Repository();

    on<GetEmployee>((event, emit) async {
      try {
        emit(EmployeeInitial());
        final mList = await repository.fetchEmployee();
        emit(EmployeeLoaded(mList));
        if(mList.error != null){
          emit(EmployeeError(mList.error));
        }
      } on NetworkError {
        emit(EmployeeError("Error"));
      }
    });
  }
}
