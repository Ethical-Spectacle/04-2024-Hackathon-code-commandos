import '/flutter_flow/flutter_flow_util.dart';
import 'payment_details1_widget.dart' show PaymentDetails1Widget;
import 'package:flutter/material.dart';

class PaymentDetails1Model extends FlutterFlowModel<PaymentDetails1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for card_number widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberController;
  String? Function(BuildContext, String?)? cardNumberControllerValidator;
  String? _cardNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid card number.';
    }

    if (val.length < 16) {
      return 'Please enter a valid card number.';
    }
    if (val.length > 16) {
      return 'Please enter a valid card number.';
    }
    if (!RegExp('^[0-9]{16}\$').hasMatch(val)) {
      return 'Please enter a valid card number.';
    }
    return null;
  }

  // State field(s) for expiry widget.
  FocusNode? expiryFocusNode;
  TextEditingController? expiryController;
  String? Function(BuildContext, String?)? expiryControllerValidator;
  String? _expiryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a valid expiry date.';
    }

    if (!RegExp('^\\d{2}/\\d{2}\$').hasMatch(val)) {
      return 'Enter a valid expiry date in the format MM/YY.';
    }
    return null;
  }

  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvController;
  String? Function(BuildContext, String?)? cvvControllerValidator;
  String? _cvvControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid CVV.';
    }

    if (val.length < 3) {
      return 'Please enter a valid CVV.';
    }
    if (val.length > 5) {
      return 'Please enter a valid CVV.';
    }
    if (!RegExp('^[0-9]{3,5}\$').hasMatch(val)) {
      return 'Please enter a valid CVV.';
    }
    return null;
  }

  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipController;
  String? Function(BuildContext, String?)? zipControllerValidator;
  String? _zipControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid zip code.';
    }

    if (val.length < 5) {
      return 'Please enter a valid zip code.';
    }
    if (val.length > 5) {
      return 'Please enter a valid zip code.';
    }
    if (!RegExp('^[0-9]{5}\$').hasMatch(val)) {
      return 'Please enter a valid zip code.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    cardNumberControllerValidator = _cardNumberControllerValidator;
    expiryControllerValidator = _expiryControllerValidator;
    cvvControllerValidator = _cvvControllerValidator;
    zipControllerValidator = _zipControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardNumberFocusNode?.dispose();
    cardNumberController?.dispose();

    expiryFocusNode?.dispose();
    expiryController?.dispose();

    cvvFocusNode?.dispose();
    cvvController?.dispose();

    zipFocusNode?.dispose();
    zipController?.dispose();
  }
}
