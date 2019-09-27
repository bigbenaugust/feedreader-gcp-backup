<?php
require_once("php/autoloader.php");
require("get_random_line.php");
$feedarray=file("feeds.txt");
$length = 4;
echo "<!DOCTYPE HTML><html><head>
      <meta name='viewport' content='width=device-width, initial-scale=1'>
      <title>Usual RSS Feeds</title>
      <link href='https://feedreader-bigbenaugust.apps.unc.edu/php/favicon.ico' rel='icon' type='image/x-icon' />
      <link rel='stylesheet' href='https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css'>
      <script src='https://code.jquery.com/jquery-1.11.2.min.js'></script>
      <script src='https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js'></script>
      </head><body>
      <div data-role='page' id='page' class='type-interior' data-theme='b'>
      <div data-role='header'>Ben's Stuff</div>
      <div data-role='main' class='ui-mini'>
      <small>";
echo rand_line("fortunes.txt");
echo "</small>
      <div data-role='collapsible' data-inset='false'>
      <h4>Weather</h4>
      <ul data-role='listview' class='ui-mini'>
      <li class='ui-mini'><a href='http://mobile.weather.gov/index.php?lat=35.9101438&lon=-79.0752895' target='_blank'>Carrboro Weather (NWS)</a></li>
      <li class='ui-mini'><a href='http://www.wral.com/weather/' target='_blank'>WRAL Weather</a></li>
      </ul>
      </div>";

foreach ($feedarray as $key => $url) {
	$feed = new SimplePie();
	$feed->set_feed_url($url);
	$feed->enable_cache(true);	
	$feed->set_cache_duration(3600);
	$feed->init();
	$feed->handle_content_type();
	echo '<div data-role="collapsible" data-inset="false">
              <h4><a href="' . $feed->get_permalink() . '" target="_blank">' . $feed->get_title() . '</a></h4>
              <ul data-role="listview" class="ui-mini">';
	foreach ($feed->get_items(0,$length) as $key=>$item) {
		echo '<li class="ui-mini">
                      <a href="' . $item->get_permalink() . '" target="_blank">' . $item->get_title() . ' : ' . $item->get_date() . '</a>
                      </li>
                      ';
	}
	echo '</ul>
              </li>
              </div>';
	$feed->__destruct();
	unset($item);
	unset($feed);
	}
echo "</div>
      </div>
      </div>
      </div>
      </body>
      </html>";
?>
