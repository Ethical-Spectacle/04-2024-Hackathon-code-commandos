import '/flutter_flow/flutter_flow_util.dart';
import 'app_onboarding_widget.dart' show AppOnboardingWidget;
import 'package:flutter/material.dart';

class AppOnboardingModel extends FlutterFlowModel<AppOnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
