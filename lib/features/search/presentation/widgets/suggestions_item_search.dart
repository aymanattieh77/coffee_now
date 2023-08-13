import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

final suggestionsItems = [
  "Coffee",
  "Hot Coffee",
  "Ice Coffee",
  "Caramel Machiato",
  "Asprso",
];

class SuggestionsItemSearch extends StatelessWidget {
  const SuggestionsItemSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: AppSize.s10,
      spacing: AppSize.s10,
      children: List.generate(
        suggestionsItems.length,
        (index) => CustomChip(label: suggestionsItems[index]),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO  search suggestions items
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p10),
        decoration: BoxDecoration(
          color: context.isDark() ? AppColor.darkContainer : AppColor.whiteF5,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextUtils(text: label, color: AppColor.grey7C),
      ),
    );
  }
}
