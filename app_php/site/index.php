<?php
$count = 0;
if (isset($_GET['count']) && is_numeric($_GET['count'])) {
  $count = $_GET['count'];
}

$fp = fopen('/storage/visits.txt', 'a+');
fwrite($fp, time() . " - " . $_SERVER['REMOTE_ADDR'] . " - " . $count . "\n");
fclose($fp);

?>

<html>
<head>
  <meta charset="utf-8">
  <title>Rabbit counter</title>
  <link rel="icon" href="/static/favicon.png" sizes="32x32">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <p>Simple rabbit counter</p>
  <div>
    <a href="?count=<?php echo $count+1; ?>" title="Add one more rabbit"></a>
    <h2>Number of rabbits: <b><?php echo $count; ?></b></h2>
  </div>
</body>
</html>
