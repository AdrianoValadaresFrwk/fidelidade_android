import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpForm.dart';
import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpHeaderWidget.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _submit(data) {
    print(data);
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/signup/2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignUpHeader(
                imagePath: registerCirclesImg,
                iconColor: 0xff161E64,
              ),
              Container(
                height: 10,
              ),
              Text(
                'Novo usuário',
                style: TextStyle(
                    color: Color(0xff161E64),
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              Container(
                height: 20,
              ),
              SignUpForm(
                formKey: _formKey,
                onSubmit: (data) => _submit(data),
              )
            ],
          ),
        ),
      ),
    );
  }
}
