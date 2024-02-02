import 'package:rest_countries/features/country_details/data/sources/country_details.dart';
import 'package:rest_countries/features/country_details/domain/models/country_details.dart';
import 'package:rest_countries/features/country_details/domain/repositories/country_details.dart';

class CountryDetailsRepositoryImpl extends CountryDetailsRepository {
  final CountryDetailsSource source;

  CountryDetailsRepositoryImpl({required this.source});

  @override
  Future<CountryDetailsModel?> getCountryDetails(String alpha) {
    return source.getCountryDetails(alpha);
  }
}
