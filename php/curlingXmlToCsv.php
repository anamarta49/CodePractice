<?php

$ch = curl_init("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml?5105e8233f9433cf70ac379d6ccc5775");

curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);

$response = curl_exec($ch);
curl_close($ch);


$xml = new SimpleXMLElement($response);

$dateStr = (string) $xml->Cube->Cube['time'];
//echo $dateStr

//getting the rate for usd, assuming usd is always first
$usdRate = $xml->Cube->Cube->Cube[0]["rate"];
//echo $usdRate;

//tested until here - OK

//TODO: fix fopen failing
$fileCsv = fopen("usd_currency_rates_".$dateStr.".csv", "w");
//cannot test from here until i get fopen to work

//insert column names
fputcsv($fileCsv, ["Currency Code","Rate"]);

foreach ($xml->Cube->Cube->Cube as $entry) {
  $currencyCode = (string) $entry["currency"];
  $rate = (string) ($entry["rate"] / $usdRate);
  fputcsv($fileCsv, [$currencyCode,$rate]);
}

fclose($fileCsv);
?>
