import 'package:fidelidade_android/pages/Home/components/HomeHeader.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            HomeHeader(name: 'Frameworkers'),
            ElevatedButton(
              onPressed: null,
              child: Text('Home content'),
            ),
          ]),
    );
  }
}
