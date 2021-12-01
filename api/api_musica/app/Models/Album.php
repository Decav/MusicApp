<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Album extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'albums';

    public function albumArtistas(){
        return $this->hasMany(AlbumArtista::class);
    }
}
