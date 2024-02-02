import '../../domain/models/country.dart';

abstract class CountryListSource {
  Future<List<CountryModel?>?> getCountryList();
}
