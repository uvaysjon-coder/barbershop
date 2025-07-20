import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../core/constants/urls.dart';

abstract interface class ProfileService {
  Future<Response> userUpdate(
      String userId,
      String? userName,
      String? password,
      String? phoneNumber,
      File? image,
      );
}

class ProfileServiceImpl implements ProfileService {
  final Dio _dio;
  ProfileServiceImpl(this._dio);

  @override
  Future<Response> userUpdate(
      String userId,
      String? userName,
      String? password,
      String? phoneNumber,
      File? image,
      ) async {

    // Agar rasm bor bo'lsa FormData ishlatamiz
    if (image != null && image.path.isNotEmpty) {
      final formData = FormData();

      if (userName != null && userName.isNotEmpty) {
        formData.fields.add(MapEntry('name', userName));
      }
      if (password != null && password.isNotEmpty) {
        formData.fields.add(MapEntry('password', password));
      }
      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        formData.fields.add(MapEntry('phoneNumber', phoneNumber));
      }

      formData.files.add(
        MapEntry(
          'ProfileImage',
          await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
            contentType: MediaType('image', 'jpeg'),
          ),
        ),
      );

      return await _dio.put(
        AppUrls.userUpdate,
        data: formData,
        queryParameters: {'Id': userId},
      );
    }
    // Agar rasm yo'q bo'lsa hamma ma'lumot query parametrlariga qo'shiladi
    else {
      Map<String, dynamic> queryParams = {'Id': userId};

      if (userName != null && userName.isNotEmpty) {
        queryParams['FirstName'] = userName;
      }
      if (password != null && password.isNotEmpty) {
        queryParams['Password'] = password;
      }
      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        queryParams['PhoneNumber'] = phoneNumber;
      }

      return await _dio.put(
        AppUrls.userUpdate,
        queryParameters: queryParams,
      );
    }
  }
}
