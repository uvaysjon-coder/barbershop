import 'package:barbershop/core/entities/base_intities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/detail_barber_entities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/schedule_entities.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';

abstract interface class DetailBarberRepository {
  Future<Either<Failure, DetailBarberEntities>> getDetailBarber(
    String id,
  );

  Future<Either<Failure,List<ScheduleEntities> >> getScheduleBarber(
    String id,DateTime date,
  );

  Future<Either<Failure, BaseEntities>> bookingBarber(
    String barberId, String userId, List<String> serviceId,DateTime date,
  );
}
