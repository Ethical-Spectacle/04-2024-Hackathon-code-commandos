import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'app_onboarding2_widget.dart' show AppOnboarding2Widget;
import 'package:flutter/material.dart';

class AppOnboarding2Model extends FlutterFlowModel<AppOnboarding2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your mobile number.';
    }

    if (val.length < 10) {
      return 'Please enter a valid mobile number.';
    }
    if (val.length > 10) {
      return 'Please enter a valid mobile number.';
    }
    if (!RegExp('^[0-9]{10}\$').hasMatch(val)) {
      return 'Please enter a valid mobile number.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Get OTP)] action in Button widget.
  ApiCallResponse? getOtpResponse;

  @override
  void initState(BuildContext context) {
    emailAddressCreateControllerValidator =
        _emailAddressCreateControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();
  }
}
