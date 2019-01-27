<?php

// db credentials
define('DB_HOST', 'localhost');
define('DB_USER', 'host2010_angular');
define('DB_PASS', '~.+Ub5Z&WDdj');
define('DB_NAME', 'host2010_angular_db');

// Connect with the database.
function connect()
{
  $connect = mysqli_connect(DB_HOST ,DB_USER ,DB_PASS ,DB_NAME);

  if (mysqli_connect_errno($connect)) {
    die("Failed to connect:" . mysqli_connect_error());
  }

  mysqli_set_charset($connect, "utf8");

  return $connect;
}

$con = connect();
