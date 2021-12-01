<?php
date_default_timezone_set('America/New_York');
require("/usr/share/php/simplepie/autoloader.php");
require("get_random_line.php");
$feedarray=file("feeds.txt");
$weatherarray=file("weather.txt");
$linkarray=file("links.txt");
$length = 4;
$days = 2;
$now = date('U');
$age = 3600*24*$days; 

## HEADERS

echo "<!DOCTYPE HTML><html><head>";
echo "<meta name='viewport' content='width=device-width, initial-scale=1'>";
echo "<title>Usual RSS Feeds</title>";
echo "<link href='favicon.ico' rel='icon' type='image/x-icon' />";
echo "<link rel='stylesheet' href='rdf.css'/>"; 
echo "</head><body>";

## PAGE STARTS HERE

echo "Ben's Stuff - Last loaded: " . date('r') . " - Local Time: <strong id='localtime'></strong><script language='javascript'>document.getElementById('localtime').innerHTML = Date();</script>";
echo "<br><small>";
echo rand_line("../fortunes.txt");
echo " - <a href='../fortunes.txt'>list</a></small><br>";

## WEATHER / BOOKMARKS

echo "<table><thead><tr><th>Weather</th><th>Bookmarks</th></tr></thead>";
echo "<tr><td><ul>";
foreach ($weatherarray as $key => $weather) {
	$info = explode(",", $weather);
	echo '<li><a href="' . $info[1] . '" target="_blank">' . $info[0] . '</a></li>';
}
echo "</ul></td>";
echo "<td><ul>";
foreach ($linkarray as $key => $link) {
	$info2 = explode(",", $link);
	echo '<li><a href="' . $info2[1] . '" target="_blank">' . $info2[0] . '</a></li>';
}
echo "</ul></td></tr></table>";

## FEEDS

# echo "<ul>";
foreach ($feedarray as $key => $url) {
	$feed = new SimplePie();
	$feed->set_feed_url($url);
	$feed->enable_cache(true);	
	$feed->set_cache_duration(3600);
	$feed->init();
	$feed->handle_content_type();
	echo "<table><tr><th id=left>";
	echo '<a href="' . $feed->get_permalink() . '" target="_blank">' . $feed->get_title() . '</a>';
	echo "</th></tr><tr><td>";
	foreach ($feed->get_items(0,$length) as $key=>$item) {
		if ( $now - strtotime($item->get_date()) <= $age ) {
			echo '<a href="' . $item->get_permalink() . '" target="_blank">' . $item->get_title() . ' : ' . $item->get_date() . '</a><br>';
		}
	}
	$feed->__destruct();
	unset($item);
	unset($feed);
	echo "</td></tr></table>";
	}

## FOOTERS

echo "</body></html>";
?>
