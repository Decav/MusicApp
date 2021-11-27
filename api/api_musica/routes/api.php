<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArtistasController;
use App\Http\Controllers\AlbumsController;
use App\Http\Controllers\CancionesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::get('/artistas',[ArtistasController::class , 'index']);
//Route::get('/artistas/{artistas}',[ArtistasController::class , 'show']);
//Route::post('/artistas',[ArtistasController::class , 'store']);
//Route::delete('/artistas/{artistas}',[ArtistasController::class , 'destroy']);

//Route::get('albums/get',[AlbumsController::class , 'index']);

//Route::get('canciones/get',[CancionesController::class , 'index']);

Route::apiResource('/artistas',ArtistasController::class);
