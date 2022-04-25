

/// status : "success"
/// data : {"id":2,"employee_name":"Garrett Winters","employee_salary":170750,"employee_age":63,"profile_image":""}
/// message : "Successfully! Record has been fetched."

class EmployeeModel {
  EmployeeModel({
    String? status,
    Data? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }
EmployeeModel.withError(this.error);
  EmployeeModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  String? _status;
  Data? _data;
  String? _message;
  String? error;
  EmployeeModel copyWith({
    String? status,
    Data? data,
    String? message,
  }) =>
      EmployeeModel(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );

  String? get status => _status;

  Data? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// id : 2
/// employee_name : "Garrett Winters"
/// employee_salary : 170750
/// employee_age : 63
/// profile_image : ""

class Data {
  Data({
    int? id,
    String? employeeName,
    int? employeeSalary,
    int? employeeAge,
    String? profileImage,
  }) {
    _id = id;
    _employeeName = employeeName;
    _employeeSalary = employeeSalary;
    _employeeAge = employeeAge;
    _profileImage = profileImage;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _employeeName = json['employee_name'];
    _employeeSalary = json['employee_salary'];
    _employeeAge = json['employee_age'];
    _profileImage = json['profile_image'];
  }

  int? _id;
  String? _employeeName;
  int? _employeeSalary;
  int? _employeeAge;
  String? _profileImage;

  Data copyWith({
    int? id,
    String? employeeName,
    int? employeeSalary,
    int? employeeAge,
    String? profileImage,
  }) =>
      Data(
        id: id ?? _id,
        employeeName: employeeName ?? _employeeName,
        employeeSalary: employeeSalary ?? _employeeSalary,
        employeeAge: employeeAge ?? _employeeAge,
        profileImage: profileImage ?? _profileImage,
      );

  int? get id => _id;

  String? get employeeName => _employeeName;

  int? get employeeSalary => _employeeSalary;

  int? get employeeAge => _employeeAge;

  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['employee_name'] = _employeeName;
    map['employee_salary'] = _employeeSalary;
    map['employee_age'] = _employeeAge;
    map['profile_image'] = _profileImage;
    return map;
  }
}
