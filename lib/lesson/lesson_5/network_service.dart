import 'dart:convert';

import 'package:http/http.dart';

import 'post_model.dart';

class NetworkService {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  //!  /*   HTTPS APIes  */

  static String API_GET = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //TODO ADD ID
  static String API_DELETE = "/posts/"; //TODO ADD ID

  //!  /*   HTTPS Requests  */

  static Future<String?> GET(
    String api,
    Map<String, String> params,
  ) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> POST(
    String api,
    Map<String, String> params,
  ) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> PUT(
    String api,
    Map<String, String> params,
  ) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String?> DEL(
    String api,
    Map<String, String> params,
  ) async {
    var uri = Uri.https(BASE, api, params);
    var response = await put(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }

  //!  /*   HTTPS Params  */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId!.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'id': post.id.toString(),
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId!.toString(),
    });
    return params;
  }

  //!  /*   HTTPS Response  */
}
