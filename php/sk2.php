<?
function palim_0(&$palims, $a, $b, $c) {	// (0:00:00-9:59:59) 	"a:bc:ba" --- a: 0-9 / b: 0-5 / c: 0-9
	$palims[] = "$a:$b$c:$b$a";
	if ($c < 9) palim_0($palims, $a, $b, $c+1);
	elseif ($b < 5) palim_0($palims, $a, $b+1, 0);
	elseif ($a < 9) palim_0($palims, $a+1, 0, 0);
}
// -----------------------------------------------------
function palim_10(&$palims, $a, $b, $c) {	// (10:00:00-23:59:59) 	"ab:cc:ba" --- a: 1-2 / b: 0-5 / c: 0-5
	$palims[] = "$a$b:$c$c:$b$a";
	if ($c < 5) palim_10($palims, $a, $b, $c+1);
	elseif ("$a$b" < 23 AND $b < 5) palim_10($palims, $a, $b+1, 0);
	elseif ($a < 2) palim_10($palims, $a+1, 0, 0);
}
// -----------------------------------------------------
$palims = array(); palim_0($palims, 0, 0, 0); palim_10($palims, 1, 0, 0);
// $palims_next = $palims; array_shift($palims_next); array_push($palims_next, "24:00:00");
foreach($palims as $i => $v) {
	if ( ! $v_next = $palims[$i+1]) $v_next = "24:00:00";	// fuer letzten Eintrag bis "0:00:00"
	list($h, $m, $s) = explode(":", $v);
	list($h_next, $m_next, $s_next) = explode(":", $v_next);
	$diffs["$v - $v_next"] = 3600*($h_next-$h) + 60*($m_next-$m) + ($s_next-$s);
}
arsort($diffs); // nach Differenzen absteigend sortieren
ob_start(); print_r($diffs); $str = ob_get_clean();
$str .= "\n\nSumme: ".array_sum($diffs)."\n";
if ($_SERVER["REMOTE_ADDR"]) echo str_replace("&lt;?", "", highlight_string('<?'.$str.'', true));
else { echo $str; file_put_contents("out.txt", $str); }
// -----------------------------------------------------
?>