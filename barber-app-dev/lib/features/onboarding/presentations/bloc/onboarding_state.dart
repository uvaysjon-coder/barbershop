part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    required this.model ,
    required this.currentIndex,
    this.name="Next",
    this.page=OnboardingEnum.next,
  });

  final List<OnboardingEntities> model ;

  final int currentIndex;
  final String name;
  final OnboardingEnum page;

  factory OnboardingState.initial() {
    return OnboardingState(currentIndex: 0, model: [
      OnboardingEntities(image:Assets.img.onboardingFirst.path,title:"Welcome Gobars" ,description: "Find the best grooming experience in your city with just one tap! Don't miss out on the haircut or treatment of your dreams. Let's start now!",),
      OnboardingEntities(image:Assets.img.onboardingTwo.path,title: "Loooking",description:"Find the best barbershop around you in seconds, make an appointment, and enjoy the best grooming experience." ,),
      OnboardingEntities(image:Assets.img.onboardingThree.path,title: "Everything in your hands" ,description: "With Gobar, find high-quality barbershops, see reviews, and make appointments easily. Achieve your confident appearance!",),
    ],name: "Next",page: OnboardingEnum.next);
  }

  OnboardingState copyWith({
    List<OnboardingEntities>? model,
    int? currentIndex,
    String? name,
    OnboardingEnum? page,
  }) {
    return OnboardingState(
      model: model ?? this.model,
      currentIndex: currentIndex ?? this.currentIndex,
      name: name ?? this.name,
      page: page ?? OnboardingEnum.next,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [model, currentIndex,name,page];
}

enum OnboardingEnum{
  finish,
  next,
  onFinish

}
