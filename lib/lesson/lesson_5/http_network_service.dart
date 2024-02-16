import 'dart:convert';

import 'package:http/http.dart';
import 'package:six_module/lesson/lesson_5/user_model_lesson5.dart';

class HomeNetworkService {
  static const String BASE = "dummy.restapiexample.com";

  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  //! /* APIes */
  static String apiGet = "/employee";
  static String apiCreate = "/create";
  static String apiUpdate = "/update/";
  static String apiDelete = "	/delete/";

  //! /* Request */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    Response response =
        await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    Response response =
        await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response = await post(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  //! /* Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Datum employee) {
    Map<String, String> params = Map();
    params.addAll({
      'employee_name': employee.employeeName,
      'employee_salary': employee.employeeSalary.toString(),
      'employee_age': employee.employeeAge.toString(),
      'profile_image': employee.profileImage,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Datum employee) {
    Map<String, String> params = Map();
    params.addAll({
      'id' : employee.id.toString(),
      'employee_name': employee.employeeName,
      'employee_salary': employee.employeeSalary.toString(),
      'employee_age': employee.employeeAge.toString(),
      'profile_image': employee.profileImage,
    });
    return params;
  }

  //! /* Response */
}
