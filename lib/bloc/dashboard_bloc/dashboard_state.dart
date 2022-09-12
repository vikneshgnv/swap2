part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {}
class DashboardError extends DashboardState {}
