<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    public function index()
    {
    	return User::orderBy('updated_at', 'desc')->paginate(10);
    }

    public function store(Request $req)
    {
    	$user = new User();
    	$user->first_name = $req->first_name;
    	$user->last_name = $req->last_name;
    	$user->email = $req->email;
    	$user->address = $req->address;
    	$user->contact = $req->contact;
    	if($user->save()){
    		return response()->json(['message' => 'success'], 200);
    	}
    	return response()->json(['message' => 'error'], 500);
    }

    public function update(Request $req, $id)
    {
    	// dd($id);
    	$user = User::find($id);
    	$user->first_name = $req->first_name;
    	$user->last_name = $req->last_name;
    	$user->email = $req->email;
    	$user->address = $req->address;
    	$user->contact = $req->contact;
    	if($user->save()){
    		return response()->json(['message' => 'success'], 200);
    	}
    	return response()->json(['message' => 'error'], 500);
    }

    public function destroy($id)
    {
    	$user = User::find($id);
    	$user->delete();

    	return response()->json(['message' => 'success'], 200);
    }
}