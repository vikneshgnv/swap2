

import 'dart:convert';

import 'package:http/http.dart';
import 'package:swap_test_2/repository/apiclient/ApiClient.dart';
import 'package:swap_test_2/repository/models/loginmodel/login_model.dart';

class LoginApi {
  ApiClient _apiClient = ApiClient();

  String _loginPath = '/login';

  Future<LoginModel> login(String code,String password) async {
    String CredentialPath = "?code=$code&password=$password";

    Response response =
    await _apiClient.invokeAPI(_loginPath+CredentialPath, 'POST_', null,"");

    return LoginModel.fromJson(jsonDecode(response.body));

  }

}