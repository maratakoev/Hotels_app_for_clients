import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(); // Инициализация Dio

  // Метод для регистрации пользователя
  Future<Response> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String guard,
  }) async {
    const String registerUrl =
        'https://app.successhotel.ru/api/client/register';

    try {
      // Подготовка данных для отправки
      final Map<String, dynamic> registrationData = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'guard': guard,
      };

      // Отправка POST-запроса с данными и возврат ответа
      final Response response =
          await _dio.post(registerUrl, data: registrationData);

      // Возвращаем ответ для обработки в вызывающем коде
      return response;
    } catch (e) {
      print('Произошла ошибка: $e');
      rethrow; // Пробрасываем ошибку дальше, чтобы её можно было обработать в вызывающем коде
    }
  }
}
