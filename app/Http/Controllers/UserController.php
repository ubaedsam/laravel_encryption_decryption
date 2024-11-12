<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all()->map(function ($user) {
            // Jika status_user adalah 1, dekripsi data, jika 0, enkripsi data
            if ($user->status_user == 1) {
                $user->name = Crypt::decryptString($user->name);
                $user->email = Crypt::decryptString($user->email);
                $user->password = Crypt::decryptString($user->password);
            } else {
                $user->name = Crypt::encryptString($user->name);
                $user->email = Crypt::encryptString($user->email);
                $user->password = Crypt::encryptString($user->password);
            }
            return $user;
        });

        return response()->json($users);
    }


    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'password' => 'required|string|min:8',
        ]);

        $validated['name'] = Crypt::encryptString($validated['name']);
        $validated['email'] = Crypt::encryptString($validated['email']);
        $validated['password'] = Crypt::encryptString($validated['password']);

        $user = User::create($validated);
        return response()->json($user, 201);
    }

    public function show($id)
    {
        $user = User::findOrFail($id);

        // Jika status_user adalah 1, dekripsi data, jika 0, enkripsi data
        if ($user->status_user == 1) {
            $user->name = Crypt::decryptString($user->name);
            $user->email = Crypt::decryptString($user->email);
            $user->password = Crypt::decryptString($user->password);
        } else {
            $user->name = Crypt::encryptString($user->name);
            $user->email = Crypt::encryptString($user->email);
            $user->password = Crypt::encryptString($user->password);
        }

        return response()->json($user);
    }


    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'string',
            'email' => 'email',
            'password' => 'string|min:8',
        ]);

        $user = User::findOrFail($id);

        if ($request->has('name')) {
            $validated['name'] = Crypt::encryptString($request->input('name'));
        }
        if ($request->has('email')) {
            $validated['email'] = Crypt::encryptString($request->input('email'));
        }
        if ($request->has('password')) {
            $validated['password'] = Crypt::encryptString($request->input('password'));
        }

        $user->update($validated);
        return response()->json($user);
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return response()->json(null, 204);
    }
}
