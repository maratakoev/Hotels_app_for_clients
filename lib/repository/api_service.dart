import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(); // Инициализация Dio

  // Метод для регистрации пользователя
  Future<void> registerUser({
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

      // Отправка POST-запроса с данными
      final Response response = await _dio.post(
        registerUrl,
        data: registrationData,
      );

      // Проверка успешности запроса
      if (response.statusCode == 200) {
        print('Регистрация успешна');
        print(
            'Ответ сервера: ${response.data}'); // Вывод полного ответа сервера
      } else {
        print('Ошибка регистрации: ${response.data}');
      }
    } catch (e) {
      print('Произошла ошибка: $e');
    }
  }
}
