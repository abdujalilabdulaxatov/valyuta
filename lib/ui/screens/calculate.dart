import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  final String name;
  final double price;
  final String code;
  Calculate(
      {required this.name, required this.price, required this.code, super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final _globalKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Calculate"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "${widget.name}",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "0.0", border: OutlineInputBorder()),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              if (_globalKey.currentState!.validate()) {
                setState(() {});
              }
            },
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text("Calculate"),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
              "${_textController.text.isNotEmpty ? int.parse(_textController.text) * widget.price : 0} so'm")
        ],
      ),
    );
  }
}
