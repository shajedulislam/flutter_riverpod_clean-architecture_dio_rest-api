import 'package:rest_countries/features/country_list/data/sources/country_list.dart';
import 'package:rest_countries/features/country_list/domain/models/country.dart';
import 'package:rest_countries/features/country_list/domain/repositories/country_list.dart';

class CountryListRepositoryImpl extends CountryListRepository {
  final CountryListSource source;

  CountryListRepositoryImpl({required this.source});

  @override
  Future<List<CountryModel?>?> getCountryList() {
    return source.getCountryList();
  }
}
