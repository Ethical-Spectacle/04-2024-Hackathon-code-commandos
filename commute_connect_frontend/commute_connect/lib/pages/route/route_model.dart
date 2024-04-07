import '/flutter_flow/flutter_flow_util.dart';
import 'route_widget.dart' show RouteWidget;
import 'package:flutter/material.dart';

class RouteModel extends FlutterFlowModel<RouteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
