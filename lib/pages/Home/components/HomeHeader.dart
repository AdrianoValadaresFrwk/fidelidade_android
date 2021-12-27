import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  const HomeHeader({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        color: Colors.blue[900],
        width: _size.width,
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
        height: 175,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.account_circle,
                      size: 75,
                      color: Colors.white,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Olá',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                    Text(name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const Icon(Icons.notifications, color: Colors.white, size: 40),
          ],
        ));
  }
}
