
import 'dart:io';

import 'package:barbershop/core/entities/base_intities.dart';

import '../../../core/exceptions/failures.dart';
import '../../../core/utils/either.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, BaseEntities>> userUpdate({
    required String userId,
    String? userName,
    String? password,
    String? phoneNumber,
    File? image,
  });
}