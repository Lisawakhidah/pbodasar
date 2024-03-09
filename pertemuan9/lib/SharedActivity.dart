import 'package:flutter/material.dart';
import 'package:pertemuan9/MySharedPref.dart';

class SharedActivity extends StatefulWidget {
  //const SharedActivity({super.key});

  @override
  State<StatefulWidget> createState() => SharedActivityState();
}

class SharedActivityState extends State<SharedActivity> {
  MySharedPref _mySharedPref = MySharedPref();

  String _value = "Kosong";

  TextEditingController controllerText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Form(
              key: _formKey,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
                      child: TextFormField(
                        controller: controllerText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Nilai',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Nilai';
                          }
                          return null;
                        },
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
                    //   child: TextFormField(
                    //     controller: controllerText,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: "Masukkan Nama",
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _mySharedPref.setValue(controllerText.value.text);
                          controllerText.text = "";
                        }
                      },
                      child: Text("Simpan"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 8),
                      child: Text("Ambil Nilai",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text("Nilai: $_value"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _mySharedPref.getValue().then((value) {
                            if (value != null) _value = value;
                          });
                        });
                      },
                      child: Text("Ambil"),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
