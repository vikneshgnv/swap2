import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swap_test_2/repository/apiclient/ApiClient.dart';
import 'package:swap_test_2/repository/models/dashboard_model/dashboard_model.dart';

class DashboardApi {
  ApiClient _apiClient = ApiClient();

  String _dashboardPath = '/homework/past-homework';

  String? token;
  String? studentId;

  getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = await prefs.get('token').toString();
    studentId = await prefs.get('studentId').toString();

  }

  Future<DashboardModel> fetchDashBoard({required int page}) async {
    await getToken();
    Response? response;
    if(page <= 1){
       response =
      await _apiClient.invokeAPI(_dashboardPath+"?student_id=$studentId", 'GET', null,token.toString());
    }else {
      response =
      await _apiClient.invokeAPI(_dashboardPath+"?student_id=$studentId&page=${page}", 'GET', null,token.toString());
    }
    return DashboardModel.fromJson(jsonDecode(response.body));

  }
}