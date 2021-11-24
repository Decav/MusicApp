<?php

namespace App\Http\Controllers;

use App\Models\Cancion;
use Illuminate\Http\Request;

class CancionesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Cancion::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $request->validate([
            'nombre_cancion' =>['required','string','max:32'],
            'fecha_lanzamiento' =>['required','integer'],
            'cod_album' => ['required', 'integer']
        ]);

        

        $cancion = new Cancion();
        $cancion->nombre_cancion = $request->nombre_cancion;
        $cancion->fecha_lanzamiento = $request->fecha_lanzamiento;
        $cancion->cod_album = $request->cod_album;
        
        $cancion->save();
        return $cancion;

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cancion  $cancion
     * @return \Illuminate\Http\Response
     */
    public function show(Cancion $cancion)
    {
        return $cancion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cancion  $cancion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cancion $cancion)
    {
        $request->validate([
            'nombre_cancion' =>['required','string','max:32'],
            'fecha_lanzamiento' =>['required','integer'],
            'cod_album' => ['required', 'integer']
        ]);
        
        $cancion->nombre_cancion = $request->nombre_cancion;
        $cancion->fecha_lanzamiento = $request->fecha_lanzamiento;
        $cancion->cod_album = $request->cod_album;
        
        $cancion->save();
        return $cancion;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cancion  $cancion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cancion $cancion)
    {
        $cancion->delete();
    }
}
