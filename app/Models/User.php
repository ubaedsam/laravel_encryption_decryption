<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;

class User extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'email', 'password'];

    // // Enkripsi data sebelum disimpan
    // public function setNameAttribute($value)
    // {
    //     $this->attributes['name'] = Crypt::encryptString($value);
    // }

    // public function setEmailAttribute($value)
    // {
    //     $this->attributes['email'] = Crypt::encryptString($value);
    // }

    // public function setPasswordAttribute($value)
    // {
    //     $this->attributes['password'] = Crypt::encryptString($value);
    // }

    // // Dekripsi data ketika diambil
    // public function getNameAttribute($value)
    // {
    //     return Crypt::decryptString($value);
    // }

    // public function getEmailAttribute($value)
    // {
    //     return Crypt::decryptString($value);
    // }

    // public function getPasswordAttribute($value)
    // {
    //     return Crypt::decryptString($value);
    // }
}
