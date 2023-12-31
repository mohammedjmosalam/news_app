import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/bloc/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: state.pageController,
          itemCount: state.pagesInHome.length,
          onPageChanged: (value) =>
              context.read<HomeCubit>().onTapTitleBottomBar(value),
          itemBuilder: (context, index) => state.pagesInHome.elementAt(index),
        );
      },
    );
  }
}
