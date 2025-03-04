import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const _Initial());

      // mencoba loading terlebih dahulu
      await Future.delayed(const Duration(seconds: 3));

      emit(const _ListenLoaded());
    });
  }
}
