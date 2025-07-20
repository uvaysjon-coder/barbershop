
import 'package:barbershop/core/data/model/base_model.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';

abstract class ForgotRepository {
  Future<Either<Failure, BaseModel>> forgotPassword(String email);
}