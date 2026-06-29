$ErrorActionPreference='Stop'
$lines=[IO.File]::ReadAllLines('index.html',[Text.Encoding]::UTF8)
$luch=[string]::Join('',[char[]](0x43B,0x443,0x447,0x448,0x438,0x439))
$out=New-Object System.Collections.Generic.List[string]
$out.Add('TOTAL='+$lines.Count)
for($i=0;$i -lt $lines.Count;$i++){
  $l=$lines[$i]
  if($l -match 'rvRoot' -or $l -match 'custom-rebuild' -or $l -match 'box-title' -or $l -match 'satin-reviews' -or $l.Contains($luch)){
    $out.Add('---- @'+($i+1))
    $end=[Math]::Min($i+12,$lines.Count-1)
    for($j=$i;$j -le $end;$j++){$out.Add(($j+1).ToString()+': '+$lines[$j])}
  }
}
[IO.File]::WriteAllLines('_g2.txt',$out,(New-Object Text.UTF8Encoding($false)))
Write-Output 'GREP_DONE'
