class Item {
  int id;
  String nim;
  String jurusan;
  String agama;
  String jenis_kelamin;
  String alamat;
  String tgl_lahir;
  String name;
  String no_tlpn;

  Item({
    this.id,
    this.nim,
    this.no_tlpn,
    this.name,
    this.tgl_lahir,
    this.alamat,
    this.jenis_kelamin,
    this.agama,
    this.jurusan,
  });

  Item.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nim = map['nim'];
    this.no_tlpn = map['no_tlpn'];
    this.name = map['name'];
    this.tgl_lahir = map['tgl_lahir'];
    this.alamat = map['alamat'];
    this.jenis_kelamin = map['jenis_kelamin'];
    this.agama = map['agama'];
    this.jurusan = map['jurusan'];
  }

  String get description => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nim': nim,
      'no_tlpn': no_tlpn,
      'name': name,
      'tgl_lahir': tgl_lahir,
      'alamat': alamat,
      'jenis_kelamin': jenis_kelamin,
      'agama': agama,
      'jurusan': jurusan,
    };
  }

  static Item fromJson(json) {
    var object = new Item();
    object.id = int.parse(json['id']);
    object.nim = json['nim'];
    object.no_tlpn = json['no_tlpn'];
    object.name = json['name'];
    object.tgl_lahir = json['tgl_lahir'];
    object.alamat = json['alamat'];
    object.jenis_kelamin = json['jenis_kelamin'];
    object.agama = json['agama'];
    object.jurusan = json['jurusan'];
    return object;
  }
}
