import 'package:coffee_now/features/home/presentation/screens/home_page.dart';
import 'package:coffee_now/features/orders/presentaion/screens/transaction_page.dart';
import 'package:coffee_now/features/profile/presentaion/screens/profile_page.dart';
import 'package:coffee_now/features/search/presentation/screens/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  int currentIndex = 0;

  final homePages = [
    const HomePage(),
    const SearchPage(),
    const TransactionPage(),
    const ProfilePage(),
  ];

  onTapChange(int index) {
    currentIndex = index;
    emit(NavigationChangeIndex(index));
  }
}
