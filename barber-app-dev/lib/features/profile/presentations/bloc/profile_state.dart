part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserEntities? user;
  final ProfileUiEvent? uiEvent;

  final bool isLoading;
  final bool imageLoading;
  final String? successMessage;
  final String? errorMessage;
  final bool? notificationValue;
  final String name,phoneNumber  ,passwordOne,passwordTwo;

  const ProfileState({
    this.user,
    this.name = '',
    this.passwordOne = '',
    this.passwordTwo = '',
    this.phoneNumber = '',
    this.notificationValue,
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
    this.imageLoading = false,
    this.uiEvent,
  });

  ProfileState copyWith({
    UserEntities? user,
    bool? isLoading,
    bool? imageLoading,
    ProfileUiEvent? uiEvent,
    String? successMessage,
    String? errorMessage,
    bool? notificationValue,
    String? name,
    String? phoneNumber,
    String? passwordOne,
    String? passwordTwo,


  }) {
    pPrint("Copying state with user: $user, isLoading: $isLoading, imageLoading: $imageLoading, uiEvent: $uiEvent");
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? false,
      imageLoading: imageLoading ?? false,
      uiEvent: uiEvent,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      notificationValue: notificationValue ?? this.notificationValue,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      passwordOne: passwordOne ?? this.passwordOne,
      passwordTwo: passwordTwo ?? this.passwordTwo,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        user,
        isLoading,
        imageLoading,
        uiEvent,
        successMessage,
        errorMessage,
        notificationValue,
        name,
        phoneNumber,

        passwordOne,
        passwordTwo,
      ];
}

enum ProfileUiEvent {
  imageSelect,
  editAccount,
  editPassword,
  exit,
  logout,
}
