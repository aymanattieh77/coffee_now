import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/search/presentation/widgets/widgets.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: AppSize.s16),
        SearchField(),
        SizedBox(height: AppSize.s20),
        SuggestionsItemSearch(),
        SizedBox(height: AppSize.s20),
        RecentSearchesSection(),
      ],
    );
  }
}
