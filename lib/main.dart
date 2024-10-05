import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talhadnad/model/user_model.dart';
import 'package:talhadnad/router/app_router.dart';
import 'package:talhadnad/theme/talhadnad_theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  final userModel = UserModel();
  await userModel.loadUserData();
  if (!userModel.accessToken.isNotEmpty) {
    userModel.logout();
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: userModel),
    ],
    child: MainApp(userModel: userModel),
  ));
}

class MainApp extends StatelessWidget {
  final UserModel userModel;

  const MainApp({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Talhadnad',
      routerConfig: getRouter(userModel),
      theme: customTheme(context),
      builder: (context, child) {
        return Builder(
          builder: (BuildContext context) {
            return child!;
          },
        );
      },
    );
  }
}
