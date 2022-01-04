import 'package:fidelidade_android/features/SignUp/presentation/pages/SignUpSecondPage.dart';
import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpForm.dart';
import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpHeaderWidget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<Offset> offsetAnimation;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    offsetAnimation = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastLinearToSlowEaseIn));
  }

  void _submit(data) {
    print(data);
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignUpSecondPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignUpHeader(
                imagePath: 'assets/images/registerCircles.png',
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}