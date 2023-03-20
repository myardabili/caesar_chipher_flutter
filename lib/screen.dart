import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic.dart';

Logic logic = Logic();
String? result;
String? plainText;
String? cipehrText;
bool flagForcolor = false;

class Screen extends StatefulWidget {
  final title;

  const Screen({super.key, this.title});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      result = '';
    });
  }

  inputFormattin() {
    if (widget.title == 'CAESAR CIPHER') {
      return {
        FilteringTextInputFormatter.allow(
          RegExp("[a-zA-Z ]"),
        ),
      };
    }
  }

  keyFormattin() {
    if (widget.title == 'CAESAR CIPHER') {
      return <TextInputFormatter>{
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        ),
      };
    }
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController input = TextEditingController();
  TextEditingController key = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: const Text(
            "Caesar Cipher Calculator",
            style: TextStyle(
              color: Colors.green,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: input,
                        // inputFormatters: inputFormattin(),
                        validator: (value) {
                          if (value!.isEmpty) return 'Required';
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            hintText: 'Masukan Plaintext/Chiphertext'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: key,
                        // inputFormatters: keyFormattin(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            hintText: 'Masukan Key'),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            flagForcolor = true;
                            if (formKey.currentState!.validate()) {
                              setState(
                                () {
                                  result = logic.caesar(
                                      input.text, int.parse(key.text), 1);
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          icon: const Icon(Icons.lock_outline),
                          label: const Text('ENCRYPT'),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            flagForcolor = false;
                            if (formKey.currentState!.validate()) {
                              setState(
                                () {
                                  result = logic.caesar(
                                      input.text, int.parse(key.text), 0);
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          icon: const Icon(Icons.lock_open_outlined),
                          label: const Text('DECRYPT'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Hasil',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: Card(
                        shadowColor: Colors.amber[900],
                        child: Text(
                          result!,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: flagForcolor ? Colors.red : Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
