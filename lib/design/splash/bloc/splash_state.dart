part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.error() = _Error;

  // listener
  const factory SplashState.listenLoaded() = _ListenLoaded;
}
