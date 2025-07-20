import 'package:barbershop/core/utils/print.dart';
import 'package:url_launcher/url_launcher_string.dart';

String getMonth(int month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "";
  }
}

 openMap(double latitude, double longitude) async {
  try {

    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    await launchUrlString(googleUrl,mode: LaunchMode.externalApplication);
  }catch(e){
    pPrint("Error: $e");

  }

}
