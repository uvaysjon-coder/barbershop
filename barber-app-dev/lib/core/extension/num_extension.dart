
import 'package:gap/gap.dart';

extension SizedExtension on num {
  // Column and Row spacing
  Gap get gap => Gap(toDouble());
}