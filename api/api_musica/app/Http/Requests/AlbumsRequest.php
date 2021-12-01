<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AlbumsRequest extends FormRequest
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
            'nombre_album' => 'required|max:32',
            'lanzamiento_year' => 'required|numeric',
            'genero_musical' => 'required|max:32',
            'nombre_grupo' => 'max:32'
            
        ];
    }
    public function messages(){
        return [
            'nombre_album.required' => 'Debe ingresar el nombre del album',
            'nombre_album.max'=> 'El nombre no puede exceder los 32 caracteres',
            'genero_musical.required' => 'Debe ingresar el genero musical',
            'genero_musical.max'=> 'El campo genero musical no puede exceder los 32 caracteres',
            'lanzamiento_year.required' => 'Debe ingresar el año de lanzamiento',
            'lanzamiento_year.numeric' => 'El año ingresado debe ser de tipo numerico',
            'nombre_grupo.max' => 'El nombre del grupo no puede exceder los 32 caracteres'
        ];
    }
}
