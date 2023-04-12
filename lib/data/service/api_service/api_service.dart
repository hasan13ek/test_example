import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_example/data/models/complaint_model.dart';
import 'package:test_example/data/service/api_client/api_client.dart';
import 'package:test_example/data/service/my_response/my_response.dart';

class ApiService extends ApiClient {
  Future<MyResponse> createComplaint(
      {required ComplaintModel complaintModel}) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.post(dio.options.baseUrl, data: {
        "to_user_id": complaintModel.toUserId,
        "category": complaintModel.category,
        "text": complaintModel.text,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        debugPrint(response.data.toString());
        myResponse.data = response.data;
      }
    } catch (e) {
      if (e is DioError) {
        print(e);
        myResponse.error = 'error';
      } else {
        myResponse.error = "ERROR";
      }
    }
    return myResponse;
  }
}
