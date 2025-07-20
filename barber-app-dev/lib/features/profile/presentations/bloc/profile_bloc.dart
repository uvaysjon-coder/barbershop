import 'dart:async';
import 'dart:io';
import 'package:barbershop/core/data/local/token_storage.dart';
import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/data/model/user_model.dart';
import '../../../../core/di/di.dart';
import '../../../../core/entities/user_entities.dart';
import '../../../../core/exceptions/failures.dart';
import '../../domain/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserStorage _userStorage = sl<UserStorage>();
  final ProfileRepository _repository = sl<ProfileRepository>();
  final TokenStorage _tokenStorage = sl<TokenStorage>();

  ProfileBloc() : super(const ProfileState()) {

    on<LogoutEvent>((event,emit){

      _userStorage.clearUser();
      _tokenStorage.removeRefreshToken();
      _tokenStorage.removeToken();

      emit(state.copyWith(
        uiEvent: ProfileUiEvent.logout,
      ));

    });

    on<ImageUpdate>((event, emit) {
      emit(state.copyWith(
        uiEvent: ProfileUiEvent.imageSelect,
      ));
    });
    on<EditAccountEvent>((event, emit) {
      emit(state.copyWith(
        uiEvent: ProfileUiEvent.editAccount,
      ));
    });
    on<EditPasswordEvent>((event, emit) {
      emit(state.copyWith(
        uiEvent: ProfileUiEvent.editPassword,
      ));
    });

    on<ProfileImageUpdateEvent>(_handleProfileImageUpdate);
    on<BuildStateEvent>((event, emit) {
      emit(state.copyWith());
    });
    on<EditEmailEvent>(_editEmail);
    on<EditPhoneNumberEvent>(_editPhoneNumber);
    on<EditNameEvent>(_editName);
    on<EditSaveButtonEvent>(_editSaveButton);

    on<EditPasswordOneEvent>((event, emit) {
      emit(state.copyWith(
        passwordOne: event.password,
      ));
    });

    on<EditPasswordTwoEvent>((event, emit) {
      emit(state.copyWith(
        passwordTwo: event.password,
      ));
    });

    on<EditPasswordButtonEvent>((event, emit)async {
      pPrint("EditPasswordButtonEvent");
      final isChanged = state.passwordOne == state.passwordTwo &&
          state.passwordOne.isNotEmpty &&
          state.passwordTwo.isNotEmpty &&
          state.user?.password != state.passwordOne;

      pPrint("isChanged: $isChanged");
      if (isChanged) {
        emit(state.copyWith(isLoading: true));
        final result = await _repository.userUpdate(
          userId: state.user?.id.toString() ?? '',
          password: state.passwordOne,
        );

        result.either((failure) {
          // Handle failure cases
          String errorMessage = "Unknown error occurred";

          if (failure is UserFailure) {
            errorMessage = failure.errorMessage;
            pPrint("User Failure: $errorMessage");
          } else if (failure is DioFailure) {
            errorMessage = failure.errorMessage;
            pPrint("Dio Failure: $errorMessage");
          } else {
            errorMessage = failure.toString();
            pPrint("Unknown Failure: $errorMessage");
          }

          emit(state.copyWith(isLoading: false, errorMessage: errorMessage));
        }, (data) {
          pPrint("Success: ${data.message}");

          try {
            // Parse user data
            final user = UserModel.fromJson(data.data);
            pPrint("User: $user");

            // Update user in storage
            _userStorage.putUser(user);

            // Update state with success
            emit(state.copyWith(
              user: user,
              successMessage: data.message,
              uiEvent: ProfileUiEvent.exit,
            ));
          } catch (parseError) {
            pPrint("Error parsing user data: $parseError");
            emit(state.copyWith(
                isLoading: false, errorMessage: "Error updating profile"));
          }
        });

      }

    });

    on<ProfileInitialEvent>((event, emit) async {
      final user = _userStorage.getUser();
      pPrint("User: $user");
      emit(state.copyWith(
        user: user,
        name: user?.name,
        phoneNumber: user?.phoneNumber,

        // notificationValue: user?.notificationValue,
      ));
    });
  }

  Future<void> _handleProfileImageUpdate(
      ProfileImageUpdateEvent event, Emitter<ProfileState> emit) async {
    try {
      // Show loading state
      emit(state.copyWith(isLoading: true));

      // Cache the image
      final Directory cacheDir = await getTemporaryDirectory();
      final String fileName =
          'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String filePath = '${cacheDir.path}/$fileName';

      // Copy the selected image to the cache directory
      final File cachedImage = await event.profileImgUrl.copy(filePath);

      // Use the cached image file for the API call
      final result = await _repository.userUpdate(
        userId: state.user?.id.toString() ?? '',
        image: cachedImage,
      );

      // Handle the result
      result.either(
        (failure) {
          // Handle failure cases
          String errorMessage = "Unknown error occurred";

          if (failure is UserFailure) {
            errorMessage = failure.errorMessage;
            pPrint("User Failure: $errorMessage");
          } else if (failure is DioFailure) {
            errorMessage = failure.errorMessage;
            pPrint("Dio Failure: $errorMessage");
          } else {
            errorMessage = failure.toString();
            pPrint("Unknown Failure: $errorMessage");
          }

          emit(state.copyWith(isLoading: false, errorMessage: errorMessage));
        },
        (data) {
          pPrint("Success: ${data.message}");

          try {
            // Parse user data
            final user = UserModel.fromJson(data.data);
            pPrint("User: $user");

            // Update user in storage
            _userStorage.putUser(user);

            // Update state with success
            emit(state.copyWith(
              isLoading: false,
              user: user,
              successMessage: data.message,
            ));
          } catch (parseError) {
            pPrint("Error parsing user data: $parseError");
            emit(state.copyWith(
                isLoading: false, errorMessage: "Error updating profile"));
          }
        },
      );
    } catch (e, s) {
      pPrint("Error: $e $s");
      emit(state.copyWith(
          isLoading: false, errorMessage: "Error updating profile image"));
    }
  }

  FutureOr<void> _editEmail(EditEmailEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
        // email:event.email,
        ));
  }

  FutureOr<void> _editName(EditNameEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      name: event.name,
    ));
  }

  FutureOr<void> _editSaveButton(
      EditSaveButtonEvent event, Emitter<ProfileState> emit) async {
    final isChanged = state.user?.name != state.name;
    // state.user?.phoneNumber != state.phoneNumber;

    if (isChanged) {
      emit(state.copyWith(isLoading: true));
      final result = await _repository.userUpdate(
        userId: state.user?.id.toString() ?? '',
        userName: state.name,
        // phoneNumber: emailNew,
      );

      result.either((failure) {
        // Handle failure cases
        String errorMessage = "Unknown error occurred";

        if (failure is UserFailure) {
          errorMessage = failure.errorMessage;
          pPrint("User Failure: $errorMessage");
        } else if (failure is DioFailure) {
          errorMessage = failure.errorMessage;
          pPrint("Dio Failure: $errorMessage");
        } else {
          errorMessage = failure.toString();
          pPrint("Unknown Failure: $errorMessage");
        }

        emit(state.copyWith(isLoading: false, errorMessage: errorMessage));
      }, (data) {
        pPrint("Success: ${data.message}");

        try {
          // Parse user data
          final user = UserModel.fromJson(data.data);
          pPrint("User: $user");

          // Update user in storage
          _userStorage.putUser(user);

          // Update state with success
          emit(state.copyWith(
              user: user,
              successMessage: data.message,
              uiEvent: ProfileUiEvent.exit));
        } catch (parseError) {
          pPrint("Error parsing user data: $parseError");
          emit(state.copyWith(errorMessage: "Error updating profile"));
        }
      });
    }
  }

  FutureOr<void> _editPhoneNumber(
      EditPhoneNumberEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
    ));
  }
}
