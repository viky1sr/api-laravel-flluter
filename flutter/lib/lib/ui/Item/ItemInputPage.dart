import 'package:flutter/material.dart';
import '../../entities/Item.dart';

import '../../entities/Item.dart';

class ItemInputPage extends StatefulWidget {
  final Item _item;
  ItemInputPage(this._item);

  @override
  ItemInputPageState createState() => ItemInputPageState(this._item);
}

class ItemInputPageState extends State<ItemInputPage> {
  final _formKey = GlobalKey<FormState>();
  Item _item;
  ItemInputPageState(this._item);
  var nim = TextEditingController();
  var name = TextEditingController();
  var tgl_lahir = TextEditingController();
  var jurusan = TextEditingController();
  var agama = TextEditingController();
  var jenis_kelamin = TextEditingController();
  var no_tlpn = TextEditingController();
  var alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_item != null) {
      nim.text = _item.nim;
      name.text = _item.name;
      no_tlpn.text = _item.no_tlpn;
      name.text = _item.name;
      tgl_lahir.text = _item.tgl_lahir;
      alamat.text = _item.alamat;
      agama.text = _item.agama;
      jurusan.text = _item.jurusan;
    }
    return Scaffold(
        appBar: AppBar(
          title: _item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  controller: nim,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Masukan Nama'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Code';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Masukan no tlp'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration:
                      new InputDecoration(labelText: 'Masukan jenis kelamin'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration:
                      new InputDecoration(labelText: 'Masukan tgl Lahir'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Masukan Jurusan'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Masukan alamat'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Masukan agama'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon Input Item_Name';
                    }
                    return null;
                  },
                ),
                new Container(
                  child: new RaisedButton(
                    child: new Text(
                      'Submit',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // // if (_item == null) {
                      // //   _item = new Item(
                      // //       id: 0,
                      // //       item_code: nim.text,
                      // //       item_name: name.text,
                      // //       price: jurusan.text,
                      // //       stock: stockController.text);
                      // // } else {
                      // //   _item.item_code = nim.text;
                      // //   _item.item_name = name.text;
                      // //   _item.price = jurusan.text;
                      // //   _item.stock = stockController.text;
                      // }
                      // Navigator.pop(context, _item);
                    },
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ));
  }
}
