<?php

use App\Http\Controllers\serverController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\ConfirmPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\Auth\VerificationController;

use App\Http\Controllers\Auth\ForgotPasswordController;

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
Route::prefix('auth')->group(function () {
    // Authentication Routes...
    Route::post('login', [LoginController::class, 'login']);
    Route::post('logout', [LoginController::class, 'logout']);

    // Registration Routes...
    Route::post('create', [RegisterController::class, 'register']);


    // // Password Reset Routes...
    // Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
    // Route::post('password/reset', 'Auth\ResetPasswordController@reset');

    // // Email Verification Routes...
    // Route::post('email/verify/{user}', 'Auth\VerificationController@verify')->name('verification.verify');
    // Route::post('email/resend', 'Auth\VerificationController@resend');
});
Route::post('influxdb/get/{mesurment}', [serverController::class, 'index']);

