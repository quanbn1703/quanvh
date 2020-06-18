<?php
$conn_string="host=ec2-52-20-248-222.compute-1.amazonaws.com port=5432 dbname=dpnnao0kdo24n user=jzdgsxyzlcciva password=b27b1833d8d309bb9f6615de5ebde8073b4f163a8d1649022fca633bdb6cf313";
$dbconn= pg_connect($conn_string);
if (isset($_POST['username'])) {
	# code...
	$username = $_POST['username'];
}

if (isset($_POST['pass'])) {
	# code...
	$pass = $_POST['pass'];
}
$sql = "SELECT * FROM tblAccount WHERE username='".$username."' AND password_='".$pass."'";
$result =pg_query($dbconn, $sql);
$row = pg_num_rows($result);
if ($row==1)
{
	echo "Login success";
}
else
{
	echo "Login failed";
}
?>
