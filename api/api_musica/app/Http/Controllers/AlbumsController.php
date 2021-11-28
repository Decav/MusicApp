<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\AlbumArtista;
use App\Http\Requests\AlbumsRequest;
use Illuminate\Http\Request;

class AlbumsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Album::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AlbumsRequest $request)
    {
        $album = new Album();
        $album->nombre_album = $request->nombre_album;
        $album->lanzamiento_year = $request->lanzamiento_year;
        $album->genero_musical = $request->genero_musical;
        $album->nombre_grupo = $request->nombre_grupo;
        $album->save();

        $interseccion = new AlbumArtista();
        $interseccion->nombre_artista = $request->nombre_artista;
        $interseccion->cod_album = $album->id;
        $interseccion->save();
        return $album;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function show(Album $album)
    {
        return $album;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function update(AlbumsRequest $request, Album $album)
    {
        /*
        $request->validate([
            'nombre_album' =>['required','string','max:32'],
            'fecha_lanzamiento' => ['required','integer'],
            'genero_musical' => ['required','string','max:32'],
            'nombre_grupo' => ['string','max:32']
        ]);
        */
        $album->nombre_album = $request->nombre_album;
        $album->lanzamiento_year = $request->lanzamiento_year;
        $album->genero_musical = $request->genero_musical;
        $album->nombre_grupo = $request->nombre_grupo;

        $album->save();
        return $album;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function destroy(Album $album)
    {
        AlbumArtista::where("cod_album",$album->id)->delete();
        $album->delete();
    }
}
