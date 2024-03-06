
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister>{
  String? valAgama, valJk;

  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();

  //key form
  GlobalKey<FormState> keyform = GlobalKey<FormState>();

  //method pilih tanggal
  Future selectDate() async{
    DateTime? pickedDate = await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      setState(() {
        txtTglLahir.text = DateFormat("dd-MM-yyyy").format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Register Form'),
      ),
      body: Form(
        key: keyform,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: txtFullName,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong!" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong!" : null;
                },
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtEmail,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong!" : null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onTap: () {
                    selectDate();
                  },
                  controller: txtTglLahir,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong!" : null;
                  },
                  decoration:  InputDecoration(
                    hintText: 'Tanggal Lahir',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtPassword,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong!" : null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    hint: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Silahkan Pilih Agama!"),
                    ),
                    items: [
                      "Islam",
                      "Buddha",
                      "Kristen",
                      "Protestan",
                    ].map((e) {
                      return DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(e),
                      ),
                      );
                    }).toList(),
                    onChanged: (val) {
                    setState(() {
                      valAgama = val;
                      if (kDebugMode) {
                        print('Agama yang dipilih: $val');
                      }
                    });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: RadioListTile(
                          value: "Laki-Laki",
                          groupValue: valJk,
                          onChanged: (val) {
                            valJk = val;
                          },
                          activeColor: Colors.green,
                          title: const Text('Laki-laki'),
                        ),
                    ),
                    Flexible(
                        child: RadioListTile(
                          value: "Wanita",
                            groupValue: valJk,
                          onChanged: (val) {
                            valJk = val;
                          },
                          activeColor: Colors.blue,
                          title: const Text('Wanita'),
                        ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                MaterialButton(
                    onPressed: () {
                      //cek kondisi & get data inputan
                      if (keyform.currentState?.validate() == true) {
                        if (valJk != null && valAgama != null) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Data Registrasi'),
                                  content: Column(
                                    children: [
                                      Text('Full name anda: ${txtFullName
                                          .text}'),
                                      Text(
                                          'Username anda: ${txtUsername.text}'),
                                      Text('Email anda: ${txtEmail.text}'),
                                      Text('Jenis kelamim anda: $valJk'),
                                      Text('Agama anda: $valAgama'),
                                      Text('Passsword anda: ${txtPassword
                                          .text}'),
                                      Text('Tanggal Lahir anda: ${txtTglLahir
                                          .text}'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'))
                                  ],
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.orange,
                                  content: Text(
                                      "Silahkan pilih dan isi data terlebih dahulu!")));
                        }
                      }
                    },
                  color: Colors.orange,
                  textColor: Colors.white,
                  height: 45,
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
   }
  }
