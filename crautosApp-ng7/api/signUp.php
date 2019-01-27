<?php
require 'connect.php';

// Get the posted data.
$postdata = file_get_contents("php://input");

if(isset($postdata) && !empty($postdata))
{
  // Extract the data.
  $request = json_decode($postdata);

  $check = "SELECT * FROM users WHERE email = '{$request->data->email}'";
  $result = mysqli_query($con, $check);
  if($result->num_rows > 0)
  {
    echo "User already exists!";
    return http_response_code(400);
  }
  else
  {
    // Validate.
    if(
      trim($request->data->first_name) === '' || 
      trim($request->data->last_name) === '' || 
      trim($request->data->email) === '' || 
      trim($request->data->password) === '' ||
      trim($request->data->confirmpassword) === ''
    )
    {
      echo "Required fields can not be empty!";
      return http_response_code(400);
    }

    if(trim($request->data->password) !== trim($request->data->confirmpassword))
    {
      echo "Password doesn't match!";
      return http_response_code(400);
    }
	
    // Sanitize.
    $first_name = mysqli_real_escape_string($con, trim($request->data->first_name));
    $last_name = mysqli_real_escape_string($con, trim($request->data->last_name));
    $email = mysqli_real_escape_string($con, trim($request->data->email));
    $password = hash('sha512', mysqli_real_escape_string($con, trim($request->data->password)));

    // Store.
    $sql = "INSERT INTO `users`
      (`id`,`first_name`, `last_name`, `email`, `password`) 
      VALUES (null,'{$first_name}', '{$last_name}', '{$email}', '{$password}')";

    if(mysqli_query($con, $sql))
    {
      http_response_code(201);
      $user = [
      'id' => mysqli_insert_id($con),
      'first_name' => $first_name,
      'last_name' => $last_name,
      'email' => $email,
      'password' => $password
      ];
      echo json_encode(['data' => $user]);
    }
    else
    {
      http_response_code(422);
    }
  }
}
