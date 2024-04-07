import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetOTPCall {
  static Future<ApiCallResponse> call({
    String? apiPhoneNumer = '1234567890',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "$apiPhoneNumer"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get OTP',
      apiUrl: 'https://375b-205-209-24-227.ngrok-free.app/get_otp',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyOTPCall {
  static Future<ApiCallResponse> call({
    String? verifyOtpPhone = '1234567890',
    String? verifyOtpOtp = '000000',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "$verifyOtpPhone",
  "otp": "$verifyOtpOtp"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify OTP',
      apiUrl: 'https://375b-205-209-24-227.ngrok-free.app/verify_otp',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRoutesCall {
  static Future<ApiCallResponse> call({
    String? apiSourceCoordinate = '10100000',
    String? apiDestinationCoordinate = '10000000',
    String? apiLeaveTime = '9:50pm',
    String? apiArrivalTime = '11:30pm',
  }) async {
    final ffApiRequestBody = '''
{
  "from_latitude": "$apiSourceCoordinate",
  "to_latitude": "$apiDestinationCoordinate",
  "from_longitude": "$apiSourceCoordinate",
  "to_longitude": "$apiDestinationCoordinate",
  "departue_time": "$apiLeaveTime",
  "arrival_time": "$apiArrivalTime"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get routes',
      apiUrl: 'https://375b-205-209-24-227.ngrok-free.app/get_routes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
