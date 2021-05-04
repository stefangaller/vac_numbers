
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numbers/numbers/api/api_client.dart';

void main() {

  test('test get timeline', () async {
    final apiClient = ApiClient(Dio());
    final result = await apiClient.eImpfpass();
    print(result);
    expect(result, isNotNull);
  });

}
