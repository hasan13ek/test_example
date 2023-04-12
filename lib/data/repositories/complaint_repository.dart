import 'package:test_example/data/models/complaint_model.dart';
import 'package:test_example/data/service/api_service/api_service.dart';
import 'package:test_example/data/service/my_response/my_response.dart';

class ComplaintRepository {
  ComplaintRepository({required ApiService apiService}) {
    _apiService = apiService;
  }
  late ApiService _apiService;

  Future<MyResponse> createComplaint(
          {required ComplaintModel complaintModel}) =>
      _apiService.createComplaint(complaintModel: complaintModel);
}
