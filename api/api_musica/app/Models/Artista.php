<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Artista extends Model
{
    use HasFactory,SoftDeletes;

    protected $tabla = 'artistas';
    protected $primaryKey = 'nombre_artista';
    public $incrementing = false;
    protected $keyType = 'string';

    public function album_artista(){
        return $this->hasMany(AlbumArtista::class);
    }
}
