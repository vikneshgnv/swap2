part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class FetchDashboard extends DashboardEvent{
  int pageNumber;
  FetchDashboard(this.pageNumber);
}