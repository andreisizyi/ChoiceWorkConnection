while(1)
{
$ssids = @("1ssid", "2ssid", "3ssid")
 foreach ($ssid in $ssids) {
    $error.clear();
    $Res = 0;
    try { 
        $Res = (Test-Connection -ComputerName 8.8.8.8 -Count 1 | Select-Object -Last 1 | Select -ExpandProperty ResponseTime);
        echo $Res;
     }
    catch { "Error occured" }

    if ($error) { 
        netsh wlan connect name=$ssid;
        start-sleep -seconds 5;
    } else {
        start-sleep -seconds 5;
    }
 }
 start-sleep -seconds 5;
}
