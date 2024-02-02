import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_design/pro_design.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:rest_countries/core/utilities/constants/colors.dart';
import 'package:rest_countries/features/country_list/domain/models/country.dart';
import 'package:rest_countries/features/country_list/presentation/views/data.dart';

import '../../../../core/utilities/enums.dart';
import '../providers/providers.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProDesign.init(context, adjustor: Platform.isIOS ? 0.265 : 0.270);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.white,
        title: ProText(
          text: "Countries",
          color: ProjectColors.black,
          fontSize: ProDesign.sp(18),
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: ProjectColors.black,
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(countryListNotifierProvider);
        if (state.dataState == DataState.initial) {
          ref.read(countryListNotifierProvider.notifier).getCountryList();
        } else if (state.dataState == DataState.loaded) {
          List<CountryModel?> countries = state.data!;
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: ProDesign.pt(16),
              vertical: ProDesign.pt(8),
            ),
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return countries[index] != null
                  ? CountryListCountryData(data: countries[index]!)
                  : const SizedBox.shrink();
            },
          );
        } else if (state.dataState == DataState.empty) {
          return ProText(
            text: state.message,
            color: ProjectColors.white,
            fontSize: ProDesign.sp(18),
            fontWeight: FontWeight.w600,
          );
        } else if (state.dataState == DataState.error) {
          return ProText(
            text: state.message,
            color: ProjectColors.white,
            fontSize: ProDesign.sp(18),
            fontWeight: FontWeight.w600,
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: ProjectColors.white),
        );
      }),
    );
  }
}
