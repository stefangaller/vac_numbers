import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numbers/numbers/repository/numbers_repository.dart';
import 'package:numbers/numbers/service/region.dart';

final numbersServiceProvider = Provider<NumbersService>((ref) {
  final numbersRepository = ref.read(numbersRepositoryProvider);
  return NumbersService(numbersRepository);
});

final selectedRegion = StateProvider((ref) => Region.all);

final latestTotalNumberProvider = FutureProvider.autoDispose((ref) {
  final numbersService = ref.read(numbersServiceProvider);
  final region = ref.watch(selectedRegion).state;
  return numbersService.getLatestTotalNumberForRegion(region);
});

class NumbersService {
  final NumbersRepository _numbersRepository;

  NumbersService(this._numbersRepository);

  Future<int> getLatestTotalNumberForRegion(Region region) async {
    final result = await _numbersRepository.getNumbers();
    return result.lastWhere((element) => element.name == region.name).count;
  }
}
