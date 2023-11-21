import 'package:flutter/material.dart';
import 'package:movie_list/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
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
        _price = int.parse(value!);
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Film baru berhasil tersimpan'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Nama: $_name'),
                          // TODO: Munculkan value-value lainnya
                          Text('Harga Tiket: $_price'),
                          Text('Deskripsi: $_description'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            _formKey.currentState!.reset();
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