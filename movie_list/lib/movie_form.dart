import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_list/menu.dart';
import 'package:movie_list/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _rating = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
        return Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Produk',
      ),
    ),
    backgroundColor: Color.fromARGB(255, 177, 132, 255),
    foregroundColor: Colors.white,
  ),
  // TODO: Tambahkan drawer yang sudah dibuat di sini
  drawer: const LeftDrawer(),

  body: Form(
    key: _formKey,
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama Film",
              labelText: "Nama Film",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Harga Tiket",
      labelText: "Harga Tiket",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    // TODO: Tambahkan variabel yang sesuai
    onChanged: (String? value) {
      setState(() {
        _rating = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        // TODO: Tambahkan variabel yang sesuai
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
      }
      return null;
    },
  ),
),
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 177, 132, 255)),
          ),
          onPressed: () async {
    if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
        "http://127.0.0.1:8000/create-flutter/",
        jsonEncode(<String, String>{
            'movie_name': _name,
            'rating': _rating.toString(),
            'description': _description,
            // TODO: Sesuaikan field data sesuai dengan aplikasimu
        }));
        if (response['status'] == 'success') {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content: Text("Movie baru berhasil disimpan!"),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
            );
        } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
                content:
                    Text("Terdapat kesalahan, silakan coba lagi."),
            ));
        }
    }
},
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
  ),
),
      ]
          
        )
      ),
  ),
);
    }
}