import '../../domain/models/country_details.dart';

abstract class CountryDetailsSource {
  Future<CountryDetailsModel?> getCountryDetails(String alpha);
}
