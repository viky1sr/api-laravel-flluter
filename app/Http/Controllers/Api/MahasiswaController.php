<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Api\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MahasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Mahasiswa::all();

        return $data;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $validator = Validator::make($data,[
            'name' => 'required',
            'nim' => 'required',
            'no_tlpn' => 'required',
            'jenis_kelamin' => 'required',
            'tgl_lahir' => 'required',
            'jurusan' => 'required',
            'alamat' => 'required',
            'agama' => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 'ok',
                'messages' => $validator->errors()->first(),
            ]);
        }

        $input= [
            'name' => $data['name'],
            'nim' => $data['nim'],
            'no_tlpn' => $data['no_tlpn'],
            'jenis_kelamin' => $data['jenis_kelamin'],
            'tgl_lahir' => $data['tgl_lahir'],
            'jurusan' => $data['jurusan'],
            'alamat' => $data['alamat'],
            'agama' => $data['agama'],
        ];
        Mahasiswa::firstOrCreate($input);

        return response()->json([
            'status' => 'ok',
            'messages' => 'Berhasil membuat data',
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Mahasiswa::find($id);

        return $data;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();

        $validator = Validator::make($data,[
            'name' => 'required',
            'nim' => 'required',
            'no_tlpn' => 'required',
            'jenis_kelamin' => 'required',
            'tgl_lahir' => 'required',
            'jurusan' => 'required',
            'alamat' => 'required',
            'agama' => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 'ok',
                'messages' => $validator->errors()->first(),
            ]);
        }

        $input= [
            'name' => $data['name'],
            'nim' => $data['nim'],
            'no_tlpn' => $data['no_tlpn'],
            'jenis_kelamin' => $data['jenis_kelamin'],
            'tgl_lahir' => $data['tgl_lahir'],
            'jurusan' => $data['jurusan'],
            'alamat' => $data['alamat'],
            'agama' => $data['agama'],
        ];
        Mahasiswa::find($id)->update($input);

        return response()->json([
            'status' => 'ok',
            'messages' => 'Berhasil update data',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = MahasiswaController::destroy($id);
        return $data;
    }
}
