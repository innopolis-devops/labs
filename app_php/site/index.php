<?php
$count = 0;
if (isset($_GET['count']) && is_numeric($_GET['count'])) {
    $count = $_GET['count'];
}
?>

<html>
<head>
    <title>Rabbit counter</title>
    <link rel="icon" href="/static/favicon.png" sizes="32x32" />
</head>
<body style="display: flex; flex-direction: column; justify-content: center; height: 100%; margin: 0;">
    <p style="text-align: center; color:#808080; font-size:15px;">Simple rabbit counter</div>
    <div style="display: flex; flex-direction: column; align-items: center; margin: auto;">
        <a href="?count=<?php echo $count+1; ?>" style="width: 256px; height: 256px; background: url('/static/rabbit.svg'); background-size: 256px;" title="Add one more rabbit"></a>
        <h2>Number of rabbits: <b><?php echo $count; ?></b></h2>
    </div>
</div>
</body>
</html>
