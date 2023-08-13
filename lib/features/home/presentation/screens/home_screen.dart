import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/features/home/presentation/controllers/navigation/navigation_cubit.dart';
import 'package:coffee_now/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: BlocProvider.of<NavigationCubit>(context).currentIndex,
            children: BlocProvider.of<NavigationCubit>(context).homePages,
          ),
          floatingActionButton: CustomBottomNavigationBar(
            currentIndex:
                BlocProvider.of<NavigationCubit>(context).currentIndex,
            onTap: BlocProvider.of<NavigationCubit>(context).onTapChange,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
