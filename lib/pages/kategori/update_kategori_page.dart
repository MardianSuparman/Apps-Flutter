import 'package:flutter/material.dart';
import '../../models/kategori_model.dart';
import '../../services/kategori_service.dart';

class EditKategoriPage extends StatefulWidget {
  final Data kategori;

  EditKategoriPage({required this.kategori});

  @override
  _EditKategoriPageState createState() => _EditKategoriPageState();
}

class _EditKategoriPageState extends State<EditKategoriPage> {
  final formKey = GlobalKey<FormState>();
  final namaKategoriController = TextEditingController();
  final KategoriService _kategoriService = KategoriService();

  @override
  void initState() {
    super.initState();
    namaKategoriController.text = widget.kategori.namaKategori ?? '';
  }

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      bool success = await _kategoriService.updateKategori(
        widget.kategori.id!,
        namaKategoriController.text,
      );
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kategori berhasil Diperbaharui!')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Memperbaharui Kategori!')),
        );
      }
    }
  }

  @override
  void dispose() {
    namaKategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: namaKategoriController,
                decoration: InputDecoration(
                  labelText: 'Nama Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Nama Kategori';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
