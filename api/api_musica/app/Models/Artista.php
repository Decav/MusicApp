<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Artista extends Model
{
    use HasFactory,SoftDeletes;

    protected $tabla = 'artistas';
    public $timestamps = false;
    protected $primaryKey = 'nombre_artista';
    public $incrementing = false;
    protected $keyType = 'string';

}
