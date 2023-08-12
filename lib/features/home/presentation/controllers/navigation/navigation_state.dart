part of 'navigation_cubit.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationChangeIndex extends NavigationState {
  final int index;
  NavigationChangeIndex(this.index);
}
