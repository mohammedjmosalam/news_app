import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_cubit.dart';
import 'widget/home_body.dart';
import 'widget/templete_catagories_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (contextB) => HomeCubit(
        context: context,
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.read<HomeCubit>().goToSavedNews(),
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 30,
              ),
            ),
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 35, 33, 25),
            centerTitle: true,
            title: const Column(
              children: [
                Text(
                  'News App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'US',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: const Color.fromARGB(255, 35, 33, 25),
            notchMargin: 25,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.selectedPage != current.selectedPage,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TemplateCatagoriesTitle(
                      title: 'Music',
                      iconData: Icons.music_note_outlined,
                      isSelected: state.selectedPage == 0,
                      onTap: () =>
                          context.read<HomeCubit>().onTapTitleBottomBar(0),
                    ),
                    const SizedBox(),
                    TemplateCatagoriesTitle(
                      title: 'Sport',
                      iconData: Icons.sports_baseball,
                      isSelected: state.selectedPage == 1,
                      onTap: () =>
                          context.read<HomeCubit>().onTapTitleBottomBar(1),
                    ),
                  ],
                );
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 35, 33, 25),
            onPressed: () => context.read<HomeCubit>().onTapSearch(),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          body: const HomeBody(),
        );
      }),
    );
  }
}
