import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swap_test_2/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:swap_test_2/repository/models/dashboard_model/dashboard_model.dart';
import 'package:swap_test_2/ui/login.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late DashboardModel dashboardModel;
  clearCredential() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(context,      MaterialPageRoute(builder: (context) =>  LoginPage()), (route) => false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DashBoard"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Text('Swap Test'),),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: (){
                  clearCredential();
                },
              )
            ],
          ),
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DashboardError) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "SomeThing Went Wrong while Fetching your Data .  Please Login Again",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 25, 10, 5),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .07,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 22),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            }

            if (state is DashboardLoaded) {
              dashboardModel =
                  BlocProvider.of<DashboardBloc>(context).dashBoardModel;
              return LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: dashboardModel.data!.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                            dashboardModel.data![index].date
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: dashboardModel
                                              .data![index].subject!.length,
                                          itemBuilder: (BuildContext context,
                                              int index1) {
                                            return Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black12)),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text("Subject Name",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Text(dashboardModel
                                                            .data![index]
                                                            .subject![index1]
                                                            .subjectName!= null ?dashboardModel
                                                            .data![index]
                                                            .subject![index1]
                                                            .subjectName.toString() :'No Subject Given' ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Title",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      dashboardModel
                                                          .data![index]
                                                          .subject![index1]
                                                          .title != null ?dashboardModel
                                                          .data![index]
                                                          .subject![index1]
                                                          .title.toString():'No Title Given' ,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.fade,
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Description",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(dashboardModel
                                                        .data![index]
                                                        .subject![index1]
                                                        .description != null ?dashboardModel
                                                        .data![index]
                                                        .subject![index1]
                                                        .description
                                                        .toString():'No Description Given'
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed:
                                dashboardModel.meta!.currentPage != null &&
                                        dashboardModel.meta!.currentPage! <= 1
                                    ? null
                                    : () {
                                  BlocProvider.of<DashboardBloc>(context).add(FetchDashboard( dashboardModel.meta!.currentPage!.toInt() - 1));
                                },
                            label: Text("Previous"),
                            icon: Icon(Icons.navigate_before),
                          ),
                          Text(
                              'Showing ${dashboardModel.meta!.currentPage} /  ${dashboardModel.meta!.lastPage}'),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                                onPressed:
                                    dashboardModel.meta!.currentPage != null &&
                                            dashboardModel.meta!.currentPage! <
                                                dashboardModel.meta!.lastPage!
                                                    .toInt()
                                        ? () {
                                  BlocProvider.of<DashboardBloc>(context).add(FetchDashboard( dashboardModel.meta!.currentPage!.toInt() + 1));
                                    }
                                        : null,
                                label: Text("Next"),
                                icon: Icon(Icons.navigate_before)),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
              });
            }
            return Container();
          },
        ));
  }
}
