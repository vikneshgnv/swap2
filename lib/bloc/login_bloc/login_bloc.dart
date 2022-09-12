import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_test_2/repository/api/login_api.dart';
import 'package:swap_test_2/repository/models/loginmodel/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginModel? loginModel;
  LoginApi loginApi;

  LoginBloc(this.loginApi) : super(LoginInitial()) {
    on<LoginUser>((event, emit) => login(event,emit,event.code,event.password));
  }

  void login(LoginEvent event,Emitter<LoginState> emit,String Id,String password) async {
    emit(LoginLoading());
    try {
      loginModel = await loginApi.login(Id, password) ;
      emit(LoginLoaded());
    } catch (e) {
      emit(LoginError());
      print("error in login>>>>>>>" + e.toString());
    }
  }
}
