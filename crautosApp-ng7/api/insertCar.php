<?php
require 'connect.php';

// Get the posted data.
$postdata = file_get_contents("php://input");

if(isset($postdata) && !empty($postdata))
{
  // Extract the data.
  $request = json_decode($postdata);
	

  // Validate.
  if(
	  trim($request->data->brand) === '' || 
	  trim($request->data->model) === '' || 
	  (int)$request->data->style < 1  || 
	  (int)$request->data->fuel < 1  || 
	  (int)$request->data->transmission < 1  || 
	  (int)$request->data->external_color < 1  || 
	  (int)$request->data->internal_color < 1  || 
	  (int)$request->data->year < 1  || 
	  (int)$request->data->price < 1
	)
  {
    return http_response_code(400);
  }
	
  // Sanitize.
  $model = mysqli_real_escape_string($con, trim($request->data->brand));
  $model = mysqli_real_escape_string($con, trim($request->data->model));
  $price = mysqli_real_escape_string($con, (int)$request->data->style);
  $price = mysqli_real_escape_string($con, (int)$request->data->fuel);
  $price = mysqli_real_escape_string($con, (int)$request->data->transmission);
  $price = mysqli_real_escape_string($con, (int)$request->data->external_color);
  $price = mysqli_real_escape_string($con, (int)$request->data->internal_color);
  $price = mysqli_real_escape_string($con, (int)$request->data->year);
  $price = mysqli_real_escape_string($con, (int)$request->data->price);

  // Store.
  $sql = "INSERT INTO `cars`
  	(`id`,`brand`, `model`, `style`, `fuel`, `transmission`, `external_color`, `internal_color`, `year`, `price`) 
	  VALUES (null,'{$brand}', '{$model}', '{$style}', '{$fuel}', '{$transmission}', '{$external_color}', '{$internal_color}', '{$year}', '{$price}')";

  if(mysqli_query($con, $sql))
  {
    http_response_code(201);
    $car = [
		'id' => mysqli_insert_id($con),
		'brand' => $brand,
		'model' => $model,
		'style' => $style,
		'fuel' => $fuel,
		'transmission' => $transmission,
		'external_color' => $external_color,
		'internal_color' => $internal_color,
		'year' => $year,
		'price' => $price
    ];
    echo json_encode(['data'=>$car]);
  }
  else
  {
    http_response_code(422);
  }
}
