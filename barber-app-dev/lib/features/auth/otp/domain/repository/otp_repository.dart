
import 'package:barbershop/features/auth/otp/domain/entities/otp_entities.dart';

import '../../../../../core/data/model/base_model.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';

abstract class OtpRepository {
  Future<Either<Failure, BaseModel>> otp({required OtpEntities request});
}