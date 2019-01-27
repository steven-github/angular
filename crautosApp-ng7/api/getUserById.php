<?php
/**
 * Returns the list of cars.
 */
require 'connect.php';

$id = $_GET['id'];
$user = [];
$sql = "SELECT id, first_name, last_name, email, password 
	FROM users
	WHERE id = {$id}";

if($result = mysqli_query($con, $sql)) 
{
	$index = 0;

	while($row = mysqli_fetch_assoc($result))
	{
		$cars[$index]['id'] = $row['id'];
		$cars[$index]['first_name'] = $row['first_name'];
		$cars[$index]['last_name'] = $row['last_name'];
		$cars[$index]['email'] = $row['email'];
		$cars[$index]['password'] = $row['password'];
		$index++;
	}

	echo json_encode(['data'=>$user]);
}
else 
{
	http_response_code(404);
}
