import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rich_editor/rich_editor.dart';
import 'dart:isolate';
import 'dart:io';

class DocWorkspace extends StatefulWidget {
  final Account account;
  const DocWorkspace(this.account, {super.key});

  @override
  State<DocWorkspace> createState() => _DocWorkspaceState();
}

class _DocWorkspaceState extends State<DocWorkspace>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RichEditorState> keyEditor = GlobalKey();
  late AnimationController _controller;
  late Document _document;
  bool _isOpen = false;

  void configAutoSave(Document document) async {
    while (true) {
      await Future.delayed(const Duration(seconds: 20));
      try {} catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void fetchSpecificDocument() async {}

  @override
  void initState() {
    // TODO: implement initState
    //  _document = Document($id: $id, $collectionId: $collectionId, $databaseId: $databaseId, $createdAt: $createdAt, $updatedAt: $updatedAt, $permissions: $permissions, data: data)
    Isolate.spawn(configAutoSave, _document);
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Text-Editor'),
              elevation: 0.sp,
            ),
            body: RichEditor(
              key: keyEditor,
              value: 'Initial HTML here',
              getImageUrl: (imageFile) {},
              getVideoUrl: (videoFile) {},
              editorOptions: RichEditorOptions(
                  enableVideo: true,
                  placeholder: "Start something writing about urself...",
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.sp, vertical: 2.sp),
                  baseFontFamily: 'sans-serif',
                  baseTextColor: Colors.black,
                  barPosition: BarPosition.TOP,
                  backgroundColor: Colors.grey[100]),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  elevation: 12.sp,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.arrow_menu,
                    progress: _controller,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isOpen = !_isOpen;

                      if (_isOpen) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    });
                  },
                ),
                if (_isOpen) Column(children: _buildChildren())
              ],
            ),
          );
        })
      ],
    );
  }

  List<Widget> _buildChildren() {
    final animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    return [
      Transform(
        transform: Matrix4.translationValues(
            -50 * animation.value, 50 * animation.value, 0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          mini: true,
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
      ),
      Transform(
        transform: Matrix4.translationValues(
            50 * animation.value, 50 * animation.value, 0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          mini: true,
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
      ),
      Transform(
        transform: Matrix4.translationValues(0, -100 * animation.value, 0),
        child: FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: Icon(
            Icons.download,
            color: Colors.white,
          ),
        ),
      ),
    ];
  }
}
