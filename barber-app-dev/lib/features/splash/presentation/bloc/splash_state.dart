part of 'splash_cubit.dart';

class SplashState extends Equatable {

  final EventSplash event;

  const SplashState({required this.event});


  copyWith({
    EventSplash? event,
  }) {
    pPrint("Copying state with event: $event");
    return SplashState(
      event: event ?? this.event,
    );
  }


  factory SplashState.initial() {
    return const SplashState(event: EventSplash.onBoarding);
  }

  @override
  List<Object> get props => [event];
}

enum EventSplash { onBoarding, login, main }
