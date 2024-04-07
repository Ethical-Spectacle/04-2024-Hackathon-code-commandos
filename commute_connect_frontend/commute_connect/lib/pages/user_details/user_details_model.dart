import '/flutter_flow/flutter_flow_util.dart';
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:flutter/material.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode1;
  TextEditingController? emailAddressCreateController1;
  String? Function(BuildContext, String?)?
      emailAddressCreateController1Validator;
  String? _emailAddressCreateController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Minimum length 2';
    }
    if (val.length > 30) {
      return 'Maximum length 30';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode2;
  TextEditingController? emailAddressCreateController2;
  String? Function(BuildContext, String?)?
      emailAddressCreateController2Validator;
  String? _emailAddressCreateController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'minimum length 2';
    }
    if (val.length > 30) {
      return 'maximum length 30';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode3;
  TextEditingController? emailAddressCreateController3;
  String? Function(BuildContext, String?)?
      emailAddressCreateController3Validator;
  String? _emailAddressCreateController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'not an email';
    }
    return null;
  }

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode4;
  TextEditingController? emailAddressCreateController4;
  String? Function(BuildContext, String?)?
      emailAddressCreateController4Validator;
  String? _emailAddressCreateController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'not gender';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressCreateController1Validator =
        _emailAddressCreateController1Validator;
    emailAddressCreateController2Validator =
        _emailAddressCreateController2Validator;
    emailAddressCreateController3Validator =
        _emailAddressCreateController3Validator;
    emailAddressCreateController4Validator =
        _emailAddressCreateController4Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressCreateFocusNode1?.dispose();
    emailAddressCreateController1?.dispose();

    emailAddressCreateFocusNode2?.dispose();
    emailAddressCreateController2?.dispose();

    emailAddressCreateFocusNode3?.dispose();
    emailAddressCreateController3?.dispose();

    emailAddressCreateFocusNode4?.dispose();
    emailAddressCreateController4?.dispose();
  }
}
