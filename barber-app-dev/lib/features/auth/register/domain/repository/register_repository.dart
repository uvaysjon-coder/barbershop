

import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/features/auth/register/domain/entities/register_entities.dart';

abstract class RegisterRepository {
  Future<Either<Failure,BaseModel>> register({required RegisterEntity request});
}