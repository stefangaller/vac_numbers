import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers/numbers/api/api_client.dart';
import 'package:numbers/numbers/repository/numbers_repository.dart';

import 'numbers_repository_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late ApiClient apiClient;
  late NumbersRepository repo;

  group('test fetch numbers', () {
    setUp(() {
      apiClient = MockApiClient();
      repo = NumbersRepository(apiClient);
    });

    test('test parse valid csv', () async {
      // given
      when(apiClient.eImpfpass()).thenAnswer((_) async => VALID_CSV);

      // when
      final numbers = await repo.getNumbers();

      // then
      expect(numbers.length, 6);
      expect(numbers.first.count, 27);
      expect(numbers.first.name, 'KeineZuordnung');
    });
  });
}

const VALID_CSV =
    '''Datum;BundeslandID;Bevölkerung;Name;EingetrageneImpfungen;EingetrageneImpfungenPro100;Teilgeimpfte;TeilgeimpftePro100;Vollimmunisierte;VollimmunisiertePro100;Gruppe_<25_M_1;Gruppe_<25_W_1;Gruppe_<25_D_1;Gruppe_25-34_M_1;Gruppe_25-34_W_1;Gruppe_25-34_D_1;Gruppe_35-44_M_1;Gruppe_35-44_W_1;Gruppe_35-44_D_1;Gruppe_45-54_M_1;Gruppe_45-54_W_1;Gruppe_45-54_D_1;Gruppe_55-64_M_1;Gruppe_55-64_W_1;Gruppe_55-64_D_1;Gruppe_65-74_M_1;Gruppe_65-74_W_1;Gruppe_65-74_D_1;Gruppe_75-84_M_1;Gruppe_75-84_W_1;Gruppe_75-84_D_1;Gruppe_>84_M_1;Gruppe_>84_W_1;Gruppe_>84_D_1;Gruppe_<25_M_2;Gruppe_<25_W_2;Gruppe_<25_D_2;Gruppe_25-34_M_2;Gruppe_25-34_W_2;Gruppe_25-34_D_2;Gruppe_35-44_M_2;Gruppe_35-44_W_2;Gruppe_35-44_D_2;Gruppe_45-54_M_2;Gruppe_45-54_W_2;Gruppe_45-54_D_2;Gruppe_55-64_M_2;Gruppe_55-64_W_2;Gruppe_55-64_D_2;Gruppe_65-74_M_2;Gruppe_65-74_W_2;Gruppe_65-74_D_2;Gruppe_75-84_M_2;Gruppe_75-84_W_2;Gruppe_75-84_D_2;Gruppe_>84_M_2;Gruppe_>84_W_2;Gruppe_>84_D_2;EingetrageneImpfungenBioNTechPfizer_1;EingetrageneImpfungenModerna_1;EingetrageneImpfungenAstraZeneca_1;EingetrageneImpfungenBioNTechPfizer_2;EingetrageneImpfungenModerna_2;EingetrageneImpfungenAstraZeneca_2
2020-12-27T23:59:59+01:00;0;;KeineZuordnung;27;;27;;0;#DIV/0!;0;0;0;0;0;0;0;1;0;2;6;0;0;0;0;0;1;0;3;3;0;1;10;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;27;0;0;0;0;0
2020-12-27T23:59:59+01:00;1;294436;Burgenland;75;0.03;75;0.03;0;0.00;0;0;0;0;0;0;2;3;0;1;1;0;2;4;0;5;5;0;6;15;0;7;24;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;75;0;0;0;0;0
2020-12-27T23:59:59+01:00;2;561293;Kärnten;0;0.00;0;0.00;0;0.00;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0
2020-12-27T23:59:59+01:00;3;1684287;Niederösterreich;190;0.01;190;0.01;0;0.00;3;4;0;3;4;0;10;14;0;8;24;0;5;18;0;6;6;0;6;25;0;4;50;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;190;0;0;0;0;0
2020-12-27T23:59:59+01:00;4;1490279;Oberösterreich;11;0.00;11;0.00;0;0.00;0;0;0;0;0;0;1;1;0;0;0;0;0;2;0;0;1;0;0;1;0;1;4;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;11;0;0;0;0;0
2020-12-27T23:59:59+01:00;5;558410;Salzburg;83;0.01;83;0.01;0;0.00;1;0;0;2;3;0;7;4;0;5;7;0;4;9;0;1;0;0;8;11;0;6;15;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;83;0;0;0;0;0''';
