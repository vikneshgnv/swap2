import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_test_2/repository/api/dashboard_api.dart';
import 'package:swap_test_2/repository/models/dashboard_model/dashboard_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

 late  DashboardModel dashBoardModel;
  DashboardApi dashboardApi;
  DashboardBloc(this.dashboardApi) : super(DashboardInitial()) {
    on<FetchDashboard>((event, emit) => fetchDashboard(event, emit, event.pageNumber));
  }

  void fetchDashboard(DashboardEvent event,Emitter<DashboardState> emit,int pageNumber) async {
    emit(DashboardLoading());
    try {
      dashBoardModel = await dashboardApi.fetchDashBoard(page: pageNumber);

      emit(DashboardLoaded());
    } catch (e) {
      emit(DashboardError());
      print("error in login>>>>>>>" + e.toString());
    }
  }
}
