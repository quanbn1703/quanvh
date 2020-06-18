<?php
$conn_string="host=ec2-34-193-117-204.compute-1.amazonaws.com port=5432 dbname=d7oprv2pq18575 user=lcomuhbqlcqciv password=a7fd4a2cf23966b22c66ddd9cf32eef4ef0f83d74889d82a8f8b860fbdf65568";
$dbconn= pg_connect($conn_string);
if (isset($_POST['username'])) {
	# code...
	$username = $_POST['username'];
}

if (isset($_POST['pass'])) {
	# code...
	$pass = $_POST['pass'];
}
$sql = "SELECT * FROM tblAccount WHERE _user='".$username."' AND _pass='".$pass."'";
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