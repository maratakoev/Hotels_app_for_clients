import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      final Map<String, dynamic> registrationData = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'guard': guard,
      };

      final Response response =
          await _dio.post(registerUrl, data: registrationData);

      return response;
    } catch (e) {
      print('Произошла ошибка: $e');
      rethrow; // Пробрасываем ошибку дальше
    }
  }

  // Метод для входа пользователя
  Future<Response> loginUser({
    required String email,
    required String password,
  }) async {
    const String loginUrl = 'https://app.successhotel.ru/api/client/login';

    try {
      final Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      final Response response = await _dio.post(loginUrl, data: loginData);
      print('Response from server: ${response.data}'); // Полный ответ

      // Проверка успешности логина
      if (response.data['success'] == true) {
        String token = response.data['token']; // Извлекаем токен
        await TokenStorage().saveToken(token); // Сохраняем токен
        print('Token saved: $token'); // Выводим в консоль
      } else {
        print('Login failed: ${response.data['message']}'); // В случае ошибки
      }

      return response;
    } catch (e) {
      print('Произошла ошибка: $e');
      rethrow; // Пробрасываем ошибку дальше
    }
  }
}

// тут сохраним токен.
class TokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final String _key = 'token'; // Ключ для хранения токена

  // Метод для сохранения токена
  Future<void> saveToken(String token) async {
    await _storage.write(key: _key, value: token);
  }

  // Метод для получения токена
  Future<String?> getToken() async {
    return await _storage.read(key: _key);
  }

  // Метод для удаления токена
  Future<void> deleteToken() async {
    await _storage.delete(key: _key);
  }

  // Новый метод для вывода токена в консоль
  Future<void> printToken() async {
    String? token = await getToken();
    if (token != null) {
      print('Токен: $token');
    } else {
      print('Токен не найден.');
    }
  }
}
