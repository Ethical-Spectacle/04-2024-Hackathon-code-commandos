import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otp_widget.dart' show OtpWidget;
import 'package:flutter/material.dart';

class OtpModel extends FlutterFlowModel<OtpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for otp-field widget.
  FocusNode? otpFieldFocusNode;
  TextEditingController? otpFieldController;
  String? Function(BuildContext, String?)? otpFieldControllerValidator;
  String? _otpFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Enter 6 digits OTP';
    }
    if (val.length > 6) {
      return 'Enter 6 digits OTP';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Verify OTP)] action in Button widget.
  ApiCallResponse? verifyOtpResponse;

  @override
  void initState(BuildContext context) {
    otpFieldControllerValidator = _otpFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    otpFieldFocusNode?.dispose();
    otpFieldController?.dispose();
  }
}
