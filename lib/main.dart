import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_example/data/repositories/complaint_repository.dart';
import 'package:test_example/data/service/api_service/api_service.dart';
import 'package:test_example/screens/tab/tab.dart';
import 'package:test_example/view_models/complaint_view_model.dart';
import 'package:test_example/view_models/state_changes_view_model.dart';
import 'package:test_example/view_models/tab_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TabViewModel()),
      ChangeNotifierProvider(create: (context) => StateChangesViewModel()),
      ChangeNotifierProvider(
        create: (context) => ComplaintViewModel(
          complaintRepository: ComplaintRepository(apiService: ApiService()),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBox(),
    );
  }
}
