import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

class Network {
  final endPoint = "https://run.mocky.io/v3/";
  final baseEndPoint = "https://run.mocky.io/";
  final _log = Logger('Network');

  //2
  Network();

  final Map<String, String> _headers = {
    'Accept': 'application/json',
  };

  // 3
  Future getData({String url, String token, bool print = true}) async {
    _log.info('Calling uri: ${endPoint + url}');
    if (token != null) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll({'Accept-Language': 'en'});
    // 4
    Response response = await get(endPoint + url, headers: _headers);

    // 5
    if (response.statusCode == 200) {
      // 6
      if (print) {
        _log.fine(response.body);
      }
    } else {
      _log.severe(response.statusCode);
      _log.severe(response.body);
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  Future<Response> postData(
      {String url,
      dynamic body,
      String token,
      bool handleError = true,
      bool contentType = false}) async {
    _log.info('Calling uri: ${endPoint + url}');
    if (token != null) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    if (contentType) {
      _headers.addAll({'Content-Type': 'application/json'});
    }
    _headers.addAll({'Accept-Language': 'en'});
    Response response = await post(endPoint + url, body: body, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      // 6

      _log.fine(response.body + response.statusCode.toString());
    } else {
      _log.severe(response.statusCode);

      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  Future<Response> putData({String url, dynamic body, String token}) async {
    if (token != null) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll({'Accept-Language': 'en'});
    Response response = await put(endPoint + url, body: body, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      // 6
      _log.fine(response.body + response.statusCode.toString());
    } else {
      _log.severe(response.statusCode);
      _log.severe(response.body);
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  Future<Response> deleteData({String url, String token}) async {
    if (token != null) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll({'Accept-Language': 'en'});
    Response response = await delete(endPoint + url, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      // 6
      _log.fine(response.body + response.statusCode.toString());
    } else {
      _log.severe(response.statusCode);
      _log.severe(response.body);
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  Future<Response> patchData({String url, dynamic body, String token}) async {
    if (token != null) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll({'Accept-Language': 'en'});
    Response response = await patch(endPoint + url, body: body, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
      // 6
      _log.fine(response.body + response.statusCode.toString());
    } else {
      _log.severe(response.statusCode);
      _log.severe(response.body);
      errorHandler(response.body, response.statusCode);
    }
    return response;
  }

  void errorHandler(String errorBody, int statusCode) {
    String message = "";
//      toast("$code")
    if (errorBody != null) {
      String body = errorBody;

      var jsonObject = jsonDecode(body);
      Map<String, dynamic> jsonObjectErrors = jsonObject['errors'];
      message = jsonObject['message'];
      var keys = jsonObjectErrors.keys;

      for (String key in keys) {
        // loop to get the dynamic key

        _log.info(key);
        // get the value of the dynamic key
        if (message.isNotEmpty) {
          message = '$message . ${jsonObjectErrors[key][0]}';
        } else {
          message = jsonObjectErrors[key][0].toString();
        }
      }
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
      _log.warning(message);
      // do something here with the value...
    }
  }
}
