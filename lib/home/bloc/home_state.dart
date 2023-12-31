part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedPage;
  final PageController pageController;
  final List<Widget> pagesInHome;

  const HomeState({
    this.selectedPage = 0,
    required this.pageController,
    required this.pagesInHome,
  });
  HomeState copyWith({
    int? selectedPage,
  }) =>
      HomeState(
        pageController: pageController,
        selectedPage: selectedPage ?? this.selectedPage,
        pagesInHome: pagesInHome,
      );

  @override
  List<Object?> get props => [selectedPage, pageController, pagesInHome];
}
