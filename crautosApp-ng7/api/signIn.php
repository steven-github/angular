<?php
require 'connect.php';

$user = [];

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

    $password = hash('sha512', mysqli_real_escape_string($con, trim($request->data->password)));

    $check = "SELECT * FROM users WHERE email = '{$request->data->email}' AND password = '{$password}'";
    $result = mysqli_query($con, $check);
  
    if($result->num_rows > 0)
    {
      
      http_response_code(201);
      $row = mysqli_fetch_assoc($result);
      echo json_encode(['data' => $row]);

    }
    else 
    {
      echo "Incorrect Password!";
      return http_response_code(400);
    }
    // $index = 0;

    // while($row = mysqli_fetch_assoc($result))
    // {
    //   $user[$index]['first_name'] = $row['first_name'];
    //   $user[$index]['last_name'] = $row['last_name'];
    //   $user[$index]['email'] = $row['email'];
    //   $index++;
    // }

    // echo json_encode(['data' => $user]);
    // http_response_code(200);
    
  }
  else 
  {
    echo "User doesn't exists!";
    return http_response_code(400);
  }
} 
