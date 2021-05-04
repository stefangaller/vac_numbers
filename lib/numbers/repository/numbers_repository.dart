import 'package:csv/csv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numbers/numbers/api/api_client.dart';
import 'package:numbers/numbers/repository/numbers.dart';

final numbersRepositoryProvider = Provider<NumbersRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return NumbersRepository(apiClient);
});

class NumbersRepository {
  final ApiClient _apiClient;

  NumbersRepository(this._apiClient);

  Future<List<Numbers>> getNumbers() async {
    final response = await _apiClient.eImpfpass();
    final result = CsvToListConverter().convert(response, fieldDelimiter: ';', eol: '\n');

    return result
        .sublist(1) // skip header
        .map((row) => Numbers(
              date: DateTime.parse(row[0]),
              name: row[3],
              count: row[4],
            ))
        .toList(growable: false);
  }
}
