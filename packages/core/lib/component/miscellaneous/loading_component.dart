import 'package:core/constant/numbers.dart';
import 'package:core/cubit/loading_cubit.dart';
import 'package:core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loadingComponent(BuildContext context, {required bool show}){
  final loadingCubit = BlocProvider.of<LoadingCubit>(context, listen: false);

  loadingCubit.changeState(show);
}

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, state) {
        if (!state) return const SizedBox();

        return ColoredBox(
          color: Colors.black45,
          child: Center(
            child: Container(
              width: 0.25.getWidth(context),
              height: 0.25.getWidth(context),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(AppNumbers.defaultRadius),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        );
      }, 
    );
  }
}