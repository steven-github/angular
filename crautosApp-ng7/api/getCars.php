<?php
/**
 * Returns the list of cars.
 */
require 'connect.php';
    
$cars = [];
$sql = "SELECT c.id, b.brand, c.model, s.style, f.fuel, t.transmission, ec.color ec, ic.color ic, y.year, c.price 
	FROM cars c 
	INNER JOIN brands b ON c.brand = b.id 
	INNER JOIN styles s ON c.style = s.id 
	INNER JOIN fuel f ON c.fuel = f.id 
	INNER JOIN transmission t ON c.transmission = t.id 
	INNER JOIN colors ec ON c.external_color = ec.id 
	INNER JOIN colors ic ON c.internal_color = ic.id 
	INNER JOIN years y ON c.year = y.id 
	ORDER BY c.id";

if($result = mysqli_query($con, $sql)) 
{
	$index = 0;

	while($row = mysqli_fetch_assoc($result))
	{
		$cars[$index]['id'] = $row['id'];
		$cars[$index]['brand'] = $row['brand'];
		$cars[$index]['model'] = $row['model'];
		$cars[$index]['style'] = $row['style'];
		$cars[$index]['fuel'] = $row['fuel'];
		$cars[$index]['transmission'] = $row['transmission'];
		$cars[$index]['external_color'] = $row['ec'];
		$cars[$index]['internal_color'] = $row['ic'];
		$cars[$index]['year'] = $row['year'];
		$cars[$index]['price'] = $row['price'];
		$index++;
	}

	echo json_encode(['data' => $cars]);
}
else 
{
	http_response_code(404);
}
