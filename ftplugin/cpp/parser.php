<?php

function parse($str){
	$cur = strpos($str, "\"sample-test\"");
	while(strpos($str, "\"input\"", $cur)){
		echo "/* Test on\n";
		$cur = strpos($str, "\"input\"", $cur);
		$tmp = strpos($str, "<pre>", $cur)+5;
		$in = substr($str, $tmp, strpos($str, "</pre>", $tmp)-$tmp);
		$cur = $tmp;
		$tmp = strpos($str, "<pre>", $cur)+5;
		$out = substr($str, $tmp, strpos($str, "</pre>", $tmp)-$tmp);
		$cur = $tmp;

		$in = preg_replace("/<br \/>/", "\n", $in);
		$out= preg_replace("/<br \/>/", "\n// ", $out);
		echo $in."// ".substr($out, 0, strlen($out)-3);
		echo "*/";
	}
}

$file = file("http://codeforces.ru/contest/".$argv[1]."/problem/".$argv[2]);

for($i=0;$i<count($file);$i++)
	if(strpos($file[$i], "sample-tests"))
		parse($file[$i]);

?>
