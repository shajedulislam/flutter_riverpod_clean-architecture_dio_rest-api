import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_design/pro_design.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:rest_countries/features/country_details/domain/models/country_details.dart';
import 'package:rest_countries/features/country_details/presentation/providers/providers.dart';
import 'package:rest_countries/features/country_details/presentation/views/widgets/detail_data_row.dart';

import '../../../../core/utilities/constants/colors.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.white,
        title: ProText(
          text: "Country Details",
          color: ProjectColors.black,
          fontSize: ProDesign.sp(18),
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: ProjectColors.black,
      body: Consumer(
        builder: (context, ref, child) {
          CountryDetailsModel data =
              ref.watch(countryDetailstNotifierProvider).data!;
          return ListView(
            padding: EdgeInsets.all(ProDesign.pt(16)),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProCard(
                    padding: EdgeInsets.zero,
                    backgroundColor: ProjectColors.black,
                    borderWidth: ProDesign.pt(0.5),
                    borderColor: ProjectColors.white.withOpacity(0.5),
                    borderRadius: ProDesign.pt(8),
                    child: ProNetworkImage(
                      height: ProDesign.horizontally(30),
                      width: ProDesign.horizontally(50),
                      imageUrl: data.flags!.png!,
                      boxFit: BoxFit.cover,
                      borderRadius: ProDesign.pt(8),
                    ),
                  ),
                  ProGap(y: ProDesign.pt(16)),
                  ProText(
                    text: data.name?.common ?? "No Name",
                    color: ProjectColors.white,
                    fontSize: ProDesign.sp(16),
                    fontWeight: FontWeight.w600,
                    alignment: TextAlign.center,
                  ),
                ],
              ),
              ProGap(y: ProDesign.pt(32)),
              CountryDetailDataRow(
                label: "Official Name",
                data: data.name?.official,
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Region:",
                data: data.region,
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Country Code:",
                data: data.cca2,
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Population:",
                data: "${data.population ?? "NA"}",
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Time Zone:",
                data: data.timezones?.join(", ").toString(),
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Driving Side:",
                data: data.car?.side,
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Start of Week:",
                data: data.startOfWeek,
              ),
              ProGap(y: ProDesign.pt(16)),
              CountryDetailDataRow(
                label: "Capital:",
                data: data.capital?.join(", ").toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}
