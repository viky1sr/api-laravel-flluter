import 'package:flutter/material.dart';

import 'package:latihan_api/entities/Dictionary.dart';
import 'dart:async';

import 'package:latihan_api/models/Mdictionary.dart';
import 'package:latihan_api/ui/fragment/MenuFragment.dart';

import 'DictionaryInputPage.dart';

class DictionaryIndexPage extends StatefulWidget {
  @override
  DictionaryIndexPageState createState() => DictionaryIndexPageState();
}

class DictionaryIndexPageState extends State<DictionaryIndexPage> {
  var _mdictionary = new Mdictionary();
  int count = 0;
  List<Dictionary> dictionaryList;
  @override
  Widget build(BuildContext context) {
    if (dictionaryList == null) {
      dictionaryList = List<Dictionary>();
    }
    Future.microtask(() {
      this.updateListView();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('List Dictionary'),
      ),
      drawer: MenuFragment(),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var contact = await pushAndGetFormInputResult(context, null);
          if (contact != null) addData(contact);
        },
      ),
    );
  }

  Future<Dictionary> pushAndGetFormInputResult(
      BuildContext context, Dictionary contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return DictionaryInputPage(contact);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 45,
            ),
            title: Text(
              this.dictionaryList[index].word,
              style: textStyle,
            ),
            subtitle: Text(this.dictionaryList[index].description),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteData(dictionaryList[index]);
              },
            ),
            onTap: () async {
              var contact = await pushAndGetFormInputResult(
                  context, this.dictionaryList[index]);
              if (contact != null) editData(contact);
            },
          ),
        );
      },
    );
  }

  void addData(Dictionary object) async {
    int result = await _mdictionary.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editData(Dictionary object) async {
    int result = await _mdictionary.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteData(Dictionary object) async {
    int result = await _mdictionary.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    Future<List<Dictionary>> dictionaryListFuture = _mdictionary.getList();
    dictionaryListFuture.then((resultList) {
      setState(() {
        this.dictionaryList = resultList;
        this.count = resultList.length;
      });
    });
  }
}
