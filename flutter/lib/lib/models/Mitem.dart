import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latihan_api/configs/constants.dart';
import '../entities/Item.dart';

import '../entities/Item.dart';

class Mitem {
  Future<Item> selectById(int id) async {
    var url = apiUrlAddress + id.toString();

    final response = await http.get(url);

    List<Item> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Item.fromJson(i))
        .toList();

    if (objectList[0] == null) {
      return null;
    } else {
      return objectList[0];
    }
  }

  Future<int> insert(Item _object) async {
    var url = apiUrlAddress;
    http.post(url, body: {
      "nim": _object.nim,
      "nama": _object.name,
      "jurusan": _object.jurusan,
      "no_tlpn": _object.no_tlpn,
      "agama": _object.agama,
      "alamat": _object.alamat,
      "jenis_kelamin": _object.jenis_kelamin
    });
    return 1;
  }

  Future<int> update(Item _object) async {
    var url = apiUrlAddress;
    http.put(url, body: {
      "id": _object.id.toString(),
      "nim": _object.nim,
      "nama": _object.name,
      "jurusan": _object.jurusan,
      "no_tlpn": _object.no_tlpn,
      "agama": _object.agama,
      "alamat": _object.alamat,
      "jenis_kelamin": _object.jenis_kelamin
    });
    return 0;
  }

  Future<int> delete(int id) async {
    var url = apiUrlAddress;
    http.post(url, body: {'id': id});
    return 0;
  }

  Future<List<Item>> getList() async {
    var url = apiUrlAddress;
    final response = await http.get(url);

    List<Item> objectList;
    objectList = (json.decode(response.body) as List)
        .map((i) => Item.fromJson(i))
        .toList();
    return objectList;
  }

  Future isReady() async {
    return true;
  }
}
