<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ArtistasRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nombre_artista' => 'required|unique:artistas,nombre_artista|max:32',
            'nombre_civil' => 'max:32',
            'fecha_nacimiento' => 'required',
            'debut_year' => 'required',
            'genero' => 'required',
            
        ];
    }
    public function messages(){
        return [
            'nombre_artista.required' => 'Debe ingresar el nombre del artista',
            'nombre_artista.max'=> 'El nombre no puede exceder los 32 caracteres',
            'nombre_artista.unique' => 'Ya existe un artista con este nombre',
            'nombre_civil.max' => 'No puede tener mas de 32 caracteres',
            'fecha_nacimiento.required' => 'Debe ingresar la fecha de nacimiento',
            'genero.required' => 'Debe ingresar el genero',
            'debut_year.required' => 'Debe ingresar el año de debut',
        ];
    }
}
