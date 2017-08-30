<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
	 /**
     * Get all user records.
     *
     * @return Response
     */
    public function index()
    {
    	return User::orderBy('updated_at', 'desc')->paginate(10);
    }

     /**
     * Store new user data.
     *
     * @param  int  $id
     * @return Response
     */
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

     /**
     * Update user record.
     *
     * @param  int  $id
     * @return Response
     */

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

     /**
     * Delete user record.
     *
     * @param  int  $id
     * @return Response
     */

    public function destroy($id)
    {
    	$user = User::find($id);
    	if($user->delete()){
    		return response()->json(['message' => 'success'], 200);
    	}

    	return response()->json(['message' => 'error'], 500);
    }
}