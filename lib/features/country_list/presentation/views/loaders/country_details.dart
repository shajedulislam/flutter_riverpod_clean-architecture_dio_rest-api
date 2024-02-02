import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_design/pro_design.dart';
import 'package:pro_widgets/widgets/alert.dart';
import 'package:rest_countries/features/country_details/presentation/providers/providers.dart';
import 'package:rest_countries/features/country_details/presentation/views/country_details_screen.dart';

import '../../../../../../core/utilities/constants/colors.dart';
import '../../../../../../core/utilities/enums.dart';
import '../../../../../../core/utilities/functions/navigation.dart';
import '../../../../../core/utilities/functions/call_back.dart';

class CountryDetailsLoader extends StatelessWidget {
  final String countryAlphaCode;
  const CountryDetailsLoader({super.key, required this.countryAlphaCode});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ProjectColors.loaderBlack,
        body: Consumer(builder: (context, ref, child) {
          final state = ref.watch(countryDetailstNotifierProvider);
          if (state.dataState == DataState.initial) {
            ref
                .read(countryDetailstNotifierProvider.notifier)
                .getCountryDetails(alpha: countryAlphaCode);
          } else if (state.dataState == DataState.loaded) {
            callBackFunction(() {
              pushReplaced(screen: const CountryDetailsScreen());
            });
          } else if (state.dataState == DataState.empty) {
            return ProAlertClassic(
              title: "Oops!",
              titleFontSize: ProDesign.sp(18),
              message: state.message,
              messageFontSize: ProDesign.sp(16),
              button1Text: "Close",
              button1FontSize: ProDesign.sp(16),
              button1Function: () {
                pop();
              },
              button2Text: "Try Again",
              button2FontSize: ProDesign.sp(16),
              button2Function: () {
                ref.read(countryDetailstNotifierProvider.notifier).resetState();
              },
            );
          } else if (state.dataState == DataState.error) {
            return ProAlertClassic(
              title: "Oops!",
              titleFontSize: ProDesign.sp(18),
              message: state.message,
              messageFontSize: ProDesign.sp(16),
              button1Text: "Close",
              button1FontSize: ProDesign.sp(16),
              button1Function: () {
                pop();
              },
              button2Text: "Try Again",
              button2FontSize: ProDesign.sp(16),
              button2Function: () {
                ref.read(countryDetailstNotifierProvider.notifier).resetState();
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: ProjectColors.white),
          );
        }),
      ),
    );
  }
}
