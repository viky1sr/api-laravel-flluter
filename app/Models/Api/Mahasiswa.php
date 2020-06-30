<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    protected $table = 'mahasiswas';
    protected $fillable = ['name','nim','no_tlpn','jenis_kelamin','tgl_lahir','jurusan','alamat','agama'];
}
