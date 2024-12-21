import 'package:flutter/material.dart';                                                                                                                                                                                          import 'package:flutter/material.dart';

class InputBarcodeScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'POC do leitor de código de barras',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Aponte o leitor e escaneie',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Código lido: $value',
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.indigo,
                    duration: Duration(seconds: 3),
                  ),
                );
                _controller.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
