part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileInitialEvent extends ProfileEvent {
  const ProfileInitialEvent();

  @override
  List<Object?> get props => [];
}

class BuildStateEvent extends ProfileEvent{
  const BuildStateEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class NameUpdateEvent extends ProfileEvent {
  final String name;

  const NameUpdateEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class EmailUpdateEvent extends ProfileEvent {
  final String email;

  const EmailUpdateEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PhoneNumberUpdateEvent extends ProfileEvent {
  final String phoneNumber;

  const PhoneNumberUpdateEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PasswordUpdateEvent extends ProfileEvent {
  final String password;

  const PasswordUpdateEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class ProfileImageUpdateEvent extends ProfileEvent {
  final File profileImgUrl;

  const ProfileImageUpdateEvent(this.profileImgUrl);

  @override
  List<Object?> get props => [profileImgUrl];
}

class NotificationChange extends ProfileEvent {
  final bool value;

  const NotificationChange(this.value);

  @override
  List<Object?> get props => [value];
}

class ImageUpdate extends ProfileEvent {
  const ImageUpdate();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EditAccountEvent extends ProfileEvent {
  const EditAccountEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class EditPasswordEvent extends ProfileEvent {
  const EditPasswordEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class EditNameEvent extends ProfileEvent {
  final String name;

  const EditNameEvent(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

class EditEmailEvent extends ProfileEvent {
  final String email;

  const EditEmailEvent(this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class EditPhoneNumberEvent extends ProfileEvent {
  final String phoneNumber;

  const EditPhoneNumberEvent(this.phoneNumber);

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber];
}

class EditPasswordOneEvent extends ProfileEvent {
  final String password;

  const EditPasswordOneEvent(this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class EditPasswordTwoEvent extends ProfileEvent {
  final String password;

  const EditPasswordTwoEvent(this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class EditSaveButtonEvent extends ProfileEvent {
  const EditSaveButtonEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EditPasswordButtonEvent extends ProfileEvent {
  const EditPasswordButtonEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LogoutEvent extends ProfileEvent {
  const LogoutEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

