

import 'package:barbershop/core/entities/user_entities.dart';
import 'package:barbershop/features/auth/login/domain/entities/login_entities.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';

abstract  class LoginRepository {
  Future<Either<Failure, UserEntities>> login({required LoginEntity request});
}