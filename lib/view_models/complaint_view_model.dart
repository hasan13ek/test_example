import 'package:flutter/material.dart';
import 'package:test_example/data/models/complaint_model.dart';
import 'package:test_example/data/repositories/complaint_repository.dart';
import 'package:test_example/data/service/my_response/my_response.dart';

class ComplaintViewModel extends ChangeNotifier{
  ComplaintViewModel({required ComplaintRepository complaintRepository}){
    _complaintRepository = complaintRepository;
  }
  late  ComplaintRepository _complaintRepository;

  bool isSuccess = false;
  bool isLoading = false;
  String errorForUI = "";

  createComplaint({required ComplaintModel complaintModel}) async{
    MyResponse myResponse = await _complaintRepository.createComplaint(complaintModel: complaintModel);
    if(myResponse.error.isEmpty){
      notify(true);
      isSuccess = true;
    }else{
      notify(false);
      errorForUI = myResponse.error;
      isSuccess = false;
    }
  }

  notify(bool v){
    isLoading = v;
    notifyListeners();
  }
}