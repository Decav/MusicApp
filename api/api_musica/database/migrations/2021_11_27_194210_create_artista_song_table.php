<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArtistaSongTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('artista_song', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_artista');
            $table->bigInteger('cod_cancion')->unsigned();
            $table->foreign('nombre_artista')->references('nombre_artista')->on('artistas');
            $table->foreign('cod_cancion')->references('id')->on('songs');
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
        Schema::dropIfExists('artista_song');
    }
}
