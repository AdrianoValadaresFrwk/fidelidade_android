import 'package:fidelidade_android/appEnv.dart';
import 'package:fidelidade_android/core/DBHelper.dart';
import 'package:fidelidade_android/core/infrastructure/http_client.dart';
import 'package:fidelidade_android/features/Login/presentation/widgets/LoginBody.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqlite_api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submit(data) async {
    if (_formKey.currentState!.validate()) {
      String cpf = data.cpf.text.replaceAll(".", "").replaceAll("-", "");
      String password = data.password.text;
      print(cpf);
      print(password);

      String url = "http://192.168.101.5:8081/login";
      Map<String, String> body = {'cpf': cpf, 'password': password};
      try {
        //var token = await Dio().post(url, data: body);
        final token = await HttpClient.postAsync(
          'http://192.168.101.5:8081/login',
          headers: {},
          requestBody: body,
        );
        var db = await DBHelper();
        await db.saveToken(token.toString(), cpf);
        // String recordedToken = await db.getToken();
        // print(recordedToken);

        Navigator.of(context).pushNamed('/home');
      } catch (e) {
        print(e);
        AlertDialog alert = AlertDialog(
          title: Text("Erro"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(
        formKey: _formKey,
        onSubmit: (data) => _submit(data),
      ),
    );
  }
}
