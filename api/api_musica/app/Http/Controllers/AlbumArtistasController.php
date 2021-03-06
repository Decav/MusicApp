<?php

namespace App\Http\Controllers;

use App\Models\AlbumArtista;
use App\Models\Artista;
use Illuminate\Http\Request;

class AlbumArtistasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $albums = AlbumArtista::all();
        foreach($albums as $album){
            $album->load('album');
        }
        return $albums;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $interseccion = new AlbumArtista();
        $interseccion->nombre_artista = $request->nombre_artista;
        $interseccion->cod_album = $request->cod_album;
        $interseccion->save();
        return $interseccion;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AlbumArtista  $albumArtista
     * @return \Illuminate\Http\Response
     */
    public function show($nombre)
    {
        return AlbumArtista::where("nombre_artista",$nombre)->get();
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AlbumArtista  $albumArtista
     * @return \Illuminate\Http\Response
     */
    public function destroy(AlbumArtista $albumArtista)
    {
        $albumArtista->delete();
    }
}
