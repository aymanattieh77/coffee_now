import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';

final recentSearches = [
  "Coffee",
  "Hot Coffee",
  "Ice Coffee",
  "Caramel Machiato",
];

class RecentSearchesSection extends StatelessWidget {
  const RecentSearchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _recentClearSection(context),
        const SizedBox(height: AppSize.s20),
        ...List.generate(recentSearches.length,
            (index) => _recentSearches(recentSearches[index])),
      ],
    );
  }

  Widget _recentSearches(String searchTerm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: InkWell(
        onTap: () {
          //TODO Search on this term
        },
        child: Row(
          children: [
            SvgPicture.asset(AssetsIconPath.timeCircle),
            const SizedBox(width: AppSize.s20),
            TextUtils(text: searchTerm, color: AppColor.greyAA),
            const Spacer(),
            InkWell(
                onTap: () {
                  //TODO delete form recent searches
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p10),
                  child: SvgPicture.asset(AssetsIconPath.clear),
                )),
          ],
        ),
      ),
    );
  }

  Widget _recentClearSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Row(
        children: [
          TextUtils(
            text: AppStrings.recents,
            color: context.isDark() ? AppColor.white : AppColor.dark2D,
            fontSize: FontSizes.f18,
            fontFamily: FontFamily.bebasNeue,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              //TODO clear recent Searches
            },
            child: const TextUtils(
              text: AppStrings.clear,
              color: AppColor.cyan,
              fontSize: FontSizes.f18,
              fontFamily: FontFamily.bebasNeue,
            ),
          ),
        ],
      ),
    );
  }
}
