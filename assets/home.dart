import 'package:flutter/material.dart';
import 'package:caesar_cipher/screen.dart';

final ciphers = [
  'CAESAR CIPHER',
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('CRYPTOGRAPHY ALGORITHMS',
              style: TextStyle(color: Colors.deepOrange)),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ciphers.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.050,
                  left: MediaQuery.of(context).size.height * 0.015,
                  right: MediaQuery.of(context).size.height * 0.015,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Screen(title: ciphers[index])));
                  },
                  leading: const Icon(Icons.security, color: Colors.deepOrange),
                  title: Text(ciphers[index]),
                ),
              );
            }));
  }
}
