﻿function arrayFilterSpace {
param($array)
$result = @()
for($number = 0; $number -lt $array.length; $number++) {
if ($array[$number]) {
$result += $array[$number];
}
}
return $result
}

$out = ""
$number= 0
foreach($item in Get-Process) {
$find = netstat -ano | findstr $item.Id
if ($find) {
$result = arrayFilterSpace("$find".Split(' '));
$servisport= $result[1].Substring($result[1].lastIndexOf(':')+1)
$servicename = $item.Name
$serviceway = $item.Path
$info = "Service: $servicename`r`n"
$info += "Port: $servisport`r`n"
$info += "way: $serviceway`r`n`r`n"
$out += $info
$info
$number++
}
}

cd ~\Desktop
$out | Out-File -FilePath./out.txt