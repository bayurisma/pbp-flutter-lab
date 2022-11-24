import 'package:counter_7/widgets/drawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String tipe = "";
  String hintText = "Pilih jenis";
  List<Budget> _listBudget = [];
  final List<String> list = <String>['Pemasukan', 'Pengeluaran'];
  bool isNumber(String nominal) {
    if (nominal == null) {
      return false;
    }
    return double.tryParse(nominal) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
        ),
        drawer: const DrawerList(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: Penghasilan",
                          labelText: "Judul",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.document_scanner),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            judul = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            judul = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Contoh: 500.000",
                          labelText: "Nominal",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.monetization_on),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            nominal = isNumber(value!) ? int.parse(value) : 0;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            nominal = isNumber(value!) ? int.parse(value) : 0;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              !isNumber(value)) {
                            return 'Nominal tidak boleh kosong atau berupa string!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                hint: Text("${hintText}"),
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    tipe = value!;
                                    hintText = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == "") {
                                    return "Pilih tipe budget!";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      var item = Budget(
                                          judul: judul,
                                          nominal: nominal,
                                          tipeBudget: tipe);
                                      _listBudget.add(item);

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 15,
                                              child: Container(
                                                child: ListView(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20, bottom: 20),
                                                  shrinkWrap: true,
                                                  children: <Widget>[
                                                    // ignore: prefer_const_constructors
                                                    Center(
                                                      child: const Text(
                                                          "Data berhasil ditambahkan"),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Kembali"),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])
                  ],
                ),
              ),
            )));
  }
}
