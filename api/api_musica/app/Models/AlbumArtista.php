<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class AlbumArtista extends Model
{
    use HasFactory,SoftDeletes;

    protected $tabla = 'album_artistas';

    public function album(){
        return $this->belongsTo(Album::class);
    }
    public function artista(){
        return $this->belongsTo(Artista::class);
    }
}
