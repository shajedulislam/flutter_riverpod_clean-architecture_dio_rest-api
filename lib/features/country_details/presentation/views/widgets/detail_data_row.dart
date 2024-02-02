import 'package:flutter/material.dart';
import 'package:pro_design/pro_design.dart';
import 'package:pro_widgets/widgets/gap.dart';
import 'package:pro_widgets/widgets/texts/text.dart';

import '../../../../../core/utilities/constants/colors.dart';

class CountryDetailDataRow extends StatelessWidget {
  final String label;
  final String? data;
  const CountryDetailDataRow({super.key, required this.label, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProText(
          text: label,
          color: ProjectColors.white,
          fontSize: ProDesign.sp(14),
          fontWeight: FontWeight.w600,
        ),
        ProGap(x: ProDesign.pt(8)),
        Expanded(
          child: ProText(
            text: data ?? "NA",
            color: ProjectColors.white,
            fontSize: ProDesign.sp(14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
