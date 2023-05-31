import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../../ui/state_managers/auth_controller.dart';
import '../models/response_model.dart';
import '../utils/urls.dart';

class NetworkCaller {
  // singleton
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      log('network_caller getRequest token: ${AuthController.token ?? ''}');
      final Response response = await get(Uri.parse(Urls.baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token': AuthController.token.toString(),
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }

  static Future<ResponseModel> postRequest(
      {required String url, required Map<String, dynamic>? body}) async {
    try {
      log('network_caller postRequest token: ${AuthController.token ?? ''}');
      final Response response = await post(Uri.parse(Urls.baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token': AuthController.token ?? '',
        },
        body: jsonEncode(body));

      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return ResponseModel(
          isSuccess: false, statusCode: -1, returnData: e.toString());
    }
  }
}
