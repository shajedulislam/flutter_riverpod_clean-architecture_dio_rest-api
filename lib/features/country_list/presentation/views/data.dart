import 'package:flutter/material.dart';
import 'package:pro_design/pro_design.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:rest_countries/core/utilities/constants/colors.dart';
import 'package:rest_countries/core/utilities/functions/navigation.dart';
import 'package:rest_countries/core/utilities/functions/null_checker.dart';
import 'package:rest_countries/features/country_list/domain/models/country.dart';
import 'package:rest_countries/features/country_list/presentation/views/loaders/country_details.dart';

class CountryListCountryData extends StatelessWidget {
  final CountryModel data;
  const CountryListCountryData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ProTapper(
      padding: EdgeInsets.symmetric(vertical: ProDesign.pt(8)),
      onTap: () {
        if (!isNull(data.cca2)) {
          loader(screen: CountryDetailsLoader(countryAlphaCode: data.cca2!));
        }
      },
      child: Row(
        children: [
          data.flags != null && data.flags!.png != null
              ? Padding(
                  padding: EdgeInsets.only(right: ProDesign.pt(8)),
                  child: ProNetworkImage(
                    height: ProDesign.pt(30),
                    width: ProDesign.pt(30),
                    imageUrl: data.flags!.png!,
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: ProText(
              text: data.name?.common ?? "No Name",
              color: ProjectColors.white,
              fontSize: ProDesign.sp(16),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
