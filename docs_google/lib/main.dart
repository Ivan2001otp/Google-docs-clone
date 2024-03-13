import 'package:docs_google/Constant/asset.dart';
import 'package:docs_google/Database/Remote/appwrite.db.dart';
import 'package:docs_google/Pages/docs.workspace.dart';
import 'package:docs_google/Pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appwrite/appwrite.dart' as appModels;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var inst = AppWrite();
  inst.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  appModels.Account account = appModels.Account(inst.instance);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context);
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.deepPurple,
            textTheme: TextTheme(bodyText2: TextStyle(fontSize: 24.sp)),
          ),
          child: DocWorkspace(account),
        );
      },
    ),
  );
}
