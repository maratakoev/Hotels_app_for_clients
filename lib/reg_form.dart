import './login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'auth_screen_second.dart';
import 'styles.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 253, 255, 1),
      body: Form(
        key: _formKey,
        child: ListView(children: const [
          Column(
            children: [
              SizedBox(height: 87),
              NameInput(),
              SizedBox(height: 24),
              SurnameInput(),
              SizedBox(height: 24),
              MailInput(),
              SizedBox(height: 24),
              PasswordInput(),
              SizedBox(height: 24),
              ConfirmPasswordInput(),
              SizedBox(height: 24),
              AuthScreenText(),
              SizedBox(height: 24),
              Button(),
              SizedBox(height: 64),
              LogInText(),
            ],
          ),
        ]),
      ),
    );
  }
}

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  // Метод для валидации имени
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите имя';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              prefixIcon: Image.asset('assets/images/room.png'),
              hintText: 'Имя',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 134, 126),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 240, 127, 119),
                  width: 2.0,
                ),
              ),
              hintStyle: dropDownButtonText,
            ),
            validator: _validateName, // Добавлена валидация имени
          ),
        ),
      ),
    );
  }
}

class SurnameInput extends StatefulWidget {
  const SurnameInput({super.key});

  @override
  State<SurnameInput> createState() => _SurnameInputState();
}

class _SurnameInputState extends State<SurnameInput> {
  // Метод для валидации фамилии
  String? _validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите фамилию';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              prefixIcon: Image.asset('assets/images/room.png'),
              hintText: 'Фамилия',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 134, 126),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 240, 127, 119),
                  width: 2.0,
                ),
              ),
              hintStyle: dropDownButtonText,
            ),
            validator: _validateSurname, // Добавлена валидация фамилии
          ),
        ),
      ),
    );
  }
}

class MailInput extends StatefulWidget {
  const MailInput({super.key});

  @override
  State<MailInput> createState() => _MailInputState();
}

class _MailInputState extends State<MailInput> {
  final _emailController = TextEditingController();

  // Регулярное выражение для проверки правильности email
  final String _emailPattern = r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Метод валидации email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите почту';
    }
    final regExp = RegExp(_emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Некорректный формат почты';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              prefixIcon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset('assets/images/mail.png')),
              hintText: 'Почта',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 134, 126),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 240, 127, 119),
                  width: 2.0,
                ),
              ),
              hintStyle: dropDownButtonText,
            ),
            validator: _validateEmail, // Валидация email
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true; // Добавлено для переключения видимости пароля

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TextFormField(
            obscureText:
                _obscureText, // Используем переменную для скрытия текста
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              prefixIcon: SizedBox(
                  width: 40, child: Image.asset('assets/images/password.png')),
              hintText: 'Пароль',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 134, 126),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 240, 127, 119),
                  width: 2.0,
                ),
              ),
              hintStyle: dropDownButtonText,
              suffixIcon: IconButton(
                // Добавлено для переключения видимости пароля
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: _validatePassword,
          ),
        ),
      ),
    );
  }
}

class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({super.key});

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool _obscureText = true; // Добавлено для переключения видимости пароля

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validateConfirmPassword(String? value) {
    // Логика валидации для подтверждения пароля
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TextFormField(
            obscureText:
                _obscureText, // Используем переменную для скрытия текста
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              prefixIcon: SizedBox(
                  width: 40, child: Image.asset('assets/images/password.png')),
              hintText: 'Подтверждение пароля',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 134, 126),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 240, 127, 119),
                  width: 2.0,
                ),
              ),
              hintStyle: dropDownButtonText,
              suffixIcon: IconButton(
                // Добавлено для переключения видимости пароля
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: _validateConfirmPassword,
          ),
        ),
      ),
    );
  }
}

class AuthScreenText extends StatelessWidget {
  const AuthScreenText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251,
      height: 55,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontFamily: 'Philosopher',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.85,
            height: 1.2,
            color: Color.fromRGBO(59, 59, 59, 1),
          ),
          children: [
            TextSpan(text: 'Нажимая зарегистрироваться я соглашаюсь с'),
            TextSpan(
              text: ' правилами сервиса',
              style: TextStyle(
                color: Color.fromRGBO(27, 194, 122, 1),
              ),
            ),
            TextSpan(text: ' и '),
            TextSpan(
              text: 'политикой конфиденциальности',
              style: TextStyle(
                color: Color.fromRGBO(27, 194, 122, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 57,
      decoration: commonButtonStyle,
      child: TextButton(
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
        onPressed: () {
          // Проверяем, если форма валидна
          if (Form.of(context).validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthScreenSecond()),
            );
          }
        },
        child: const Text('Зарегистрироваться', style: buttonTextStyle),
      ),
    );
  }
}

class LogInText extends StatelessWidget {
  const LogInText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251,
      height: 55,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Philosopher',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.85,
            height: 1.2,
            color: Color.fromRGBO(59, 59, 59, 1),
          ),
          children: [
            const TextSpan(text: 'Для входа в существующий личный кабинет'),
            TextSpan(
                text: ' нажмите сюда',
                style: const TextStyle(
                  color: Color.fromRGBO(27, 194, 122, 1),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginForm()));
                  }),
          ],
        ),
      ),
    );
  }
}
