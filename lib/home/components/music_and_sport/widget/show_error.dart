import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/components/music_and_sport/bloc/music_and_sport_cubit.dart';

class ShowErrorMassage extends StatelessWidget {
  const ShowErrorMassage({
    super.key,
    required this.errorMassage,
  });
  final String errorMassage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMassage),
        IconButton(
          onPressed: () =>
              context.read<MusicAndSportCubit>().refreshToGetData(),
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}
