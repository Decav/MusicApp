<?php

namespace App\Http\Controllers;

use App\Models\Song;
use Illuminate\Http\Request;

class SongsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Song::all();
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

        

        $song = new Song();
        $song->nombre_cancion = $request->nombre_cancion;
        $song->fecha_lanzamiento = $request->fecha_lanzamiento;
        $song->cod_album = $request->cod_album;
        
        $song->save();
        return $song;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Song  $song
     * @return \Illuminate\Http\Response
     */
    public function show(Song $song)
    {
        return $song;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Song  $song
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Song $song)
    {
        $request->validate([
            'nombre_cancion' =>['required','string','max:32'],
            'fecha_lanzamiento' =>['required','integer'],
            'cod_album' => ['required', 'integer']
        ]);

        
        $song->nombre_cancion = $request->nombre_cancion;
        $song->fecha_lanzamiento = $request->fecha_lanzamiento;
        $song->cod_album = $request->cod_album;
        
        $song->save();
        return $song;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Song  $song
     * @return \Illuminate\Http\Response
     */
    public function destroy(Song $song)
    {
        $song->delete();
    }
}
