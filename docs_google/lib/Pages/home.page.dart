import 'package:appwrite/appwrite.dart' as appModels;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  final appModels.Account account;

  const HomePage(this.account, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Overlay(
      clipBehavior: Clip.antiAlias,
      initialEntries: [
        OverlayEntry(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('HomePage'),
              elevation: 0.sp,
              backgroundColor: Colors.deepPurple,
            ),
            drawer: Drawer(
              clipBehavior: Clip.antiAlias,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(12.r))),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(12.r)),
                        color: Colors.orange),
                    child: Text(
                      "Header",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Create Docs',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
