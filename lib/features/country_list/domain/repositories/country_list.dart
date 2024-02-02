import 'package:rest_countries/features/country_list/domain/models/country.dart';

abstract class CountryListRepository {
  Future<List<CountryModel?>?> getCountryList();
}
