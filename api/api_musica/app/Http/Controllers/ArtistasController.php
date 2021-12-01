<?php

namespace App\Http\Controllers;

use App\Models\Artista;
use App\Models\AlbumArtista;
use App\Http\Requests\ArtistasRequest;
use Illuminate\Http\Request;

class ArtistasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Artista::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ArtistasRequest $request)
    {
        
        $artista = new Artista();
        $artista->nombre_artista = $request->nombre_artista;
        $artista->nombre_civil = $request->nombre_civil;
        $artista->fecha_nacimiento = $request->fecha_nacimiento;
        $artista->genero = $request->genero;
        $artista->debut_year = $request->debut_year;
        $artista->biografia = $request->biografia;

        $artista->save();
        return $artista;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Artista  $artista
     * @return \Illuminate\Http\Response
     */
    public function show(Artista $artista)
    {   
        
        return $artista;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Artista  $artista
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Artista $artista)
    {
        
        //$artista->nombre_artista = $request->nombre_artista;
        $artista->nombre_civil = $request->nombre_civil;
        $artista->fecha_nacimiento = $request->fecha_nacimiento;
        $artista->genero = $request->genero;
        $artista->debut_year = $request->debut_year;
        $artista->biografia = $request->biografia;

        $artista->save();
        return $artista;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Artista  $artista
     * @return \Illuminate\Http\Response
     */
    public function destroy(Artista $artista)
    {
        AlbumArtista::where("nombre_artista",$artista->nombre_artista)->delete();

        $artista->delete();
        
    }

}
