import '/flutter_flow/flutter_flow_util.dart';
import 'navigation_page_widget.dart' show NavigationPageWidget;
import 'package:flutter/material.dart';

class NavigationPageModel extends FlutterFlowModel<NavigationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
