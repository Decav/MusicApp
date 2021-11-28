<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlbumArtistasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('album_artistas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_artista');
            $table->bigInteger('cod_album')->unsigned();
            $table->foreign('nombre_artista')->references('nombre_artista')->on('artistas')->onDelete('cascade');
            $table->foreign('cod_album')->references('id')->on('albums');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('album_artistas');
    }
}
