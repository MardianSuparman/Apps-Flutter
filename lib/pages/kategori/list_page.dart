import 'package:flutter/material.dart';
import '../../models/kategori_model.dart';
import '../../services/kategori_service.dart';
import 'form_page.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  final KategoriService _kategoriService = KategoriService();
  Kategori? _kategori;

  @override
  void initState() {
    super.initState();
    _fetchKategori();
  }

  void _fetchKategori() async {
    Kategori? kategori = await _kategoriService.fetchKategori();
    setState(() {
      _kategori = kategori;
    });
  }

  Future<void> _navigateToFormPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormKategoriPage()),
    );
    if (result == true) {
      _fetchKategori();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _navigateToFormPage(context),
          ),
        ],
      ),
      body: _kategori == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _kategori!.data?.length ?? 0,
              itemBuilder: (context, index) {
                Data kategori = _kategori!.data![index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kategori.namaKategori ?? 'Tidak Ada',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                );
              }),
    );
  }
}
