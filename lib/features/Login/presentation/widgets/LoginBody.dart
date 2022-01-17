import 'package:fidelidade_android/features/Login/presentation/widgets/ForgotPassword.dart';
import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedPasswordField.dart';
import 'package:fidelidade_android/features/Login/presentation/widgets/LoginBackground.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class _FormData {
  TextEditingController cpf = TextEditingController();
  TextEditingController password = TextEditingController();
}

class LoginBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(_FormData form) onSubmit;

  LoginBody({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  final _FormData _form = _FormData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SvgPicture.asset(
                miniLogoImg,
                width: 85,
                height: 85,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0.5),
              child: Text(
                'Bem vindo!',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Input(
                        keyboardType: TextInputType.number,
                        controller: _form.cpf,
                        hintText: 'Digite seu CPF',
                        labelText: 'CPF',
                        validator: (value) => cpfValidator(value!),
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: "###.###.###-##",
                              filter: {"#": RegExp(r'[0-9]')})
                        ]),
                    Input(
                      keyboardType: TextInputType.number,
                      controller: _form.password,
                      obscureText: true,
                      labelText: 'Senha',
                      validator: (value) {
                        if (value == null) {
                          return "Digite sua Senha";
                        }
                      },
                    ),
                    RoundedButton(
                      text: "Entrar",
                      press: () => onSubmit(_form),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ForgotPassword(
              press: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
