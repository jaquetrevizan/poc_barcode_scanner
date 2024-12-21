import 'package:flutter/material.dart';

class InputBarcodeScreenReader extends StatefulWidget {
  const InputBarcodeScreenReader({super.key});

  @override
  State<InputBarcodeScreenReader> createState() => _InputBarcodeScreenReaderState();
}

class _InputBarcodeScreenReaderState extends State<InputBarcodeScreenReader> {

  final TextEditingController _controller = TextEditingController();
  List<String> _barcodeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "POC do leitor de códigos de barras",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                autofocus: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Aponte o leitor e escaneie",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  )
                ),
                onSubmitted: (value) {
                  if(value.isNotEmpty) {
                    setState(() {
                      _barcodeList.add(value);
                    });
                    _controller.clear();
                  }
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _barcodeList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_barcodeList[index]),
                    );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
