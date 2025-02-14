import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPriceCall {
  static Future<ApiCallResponse> call({
    String? location = 'rawalpindi',
    String? season = 'summer',
    int? wifi = 1,
    int? ac = 1,
    int? parking = 1,
    int? publicTransportAccessible = 1,
    int? groceryStores = 1,
    int? restaurants = 1,
    int? hospital = 1,
    int? touristAttractions = 1,
    int? attachedBath = 1,
  }) async {
    final ffApiRequestBody = '''
{
  "Location": "${escapeStringForJson(location)}",
  "season": "${escapeStringForJson(season)}",
  "Attached Bath": ${attachedBath},
  "Wifi": ${wifi},
  "AC": ${ac},
  "Parking": ${parking},
  "public transport accessible": ${publicTransportAccessible},
  "grocery stores": ${groceryStores},
  "restaurants": ${restaurants},
  "Hospital": ${hospital},
  "nearby tourist attractions": ${touristAttractions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPrice',
      apiUrl: 'http://100.28.53.53/predict',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? price(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.predicted_price_per_day''',
      ));
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
