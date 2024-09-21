import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_motor/design/onboarding/onboarding_view.dart';

import 'bloc/splash_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        bloc: SplashBloc()..add(const SplashEvent.started()),
        listener: (context, state) {
          state.maybeWhen(
            listenLoaded: () {
              Navigator.of(context)
                  .pushReplacementNamed(OnboardingView.routeName);
            },
            error: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong'),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(
              child: Icon(Icons.abc, size: 200),
            ),
            orElse: () {
              return Container();
            },
          );
        },
      ),
    );
  }
}
