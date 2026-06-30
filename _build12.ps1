$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$data=[System.IO.File]::ReadAllText('_revrepl.json',$enc) | ConvertFrom-Json
$js='js\custom-rebuild.js'
$c=[System.IO.File]::ReadAllText($js,$enc)
$counts=@()
foreach($p in $data.pairs){
  $pat='"[^"]*' + [regex]::Escape($p.anchor) + '[^"]*"'
  $cnt=([regex]::Matches($c,$pat)).Count
  if($cnt -ge 1){
    $rep='"' + $p.new + '"'
    $c=[regex]::Replace($c,$pat,{ param($m) $rep })
  }
  $counts += ('' + $cnt)
}
[System.IO.File]::WriteAllText($js,$c,$enc)
'counts=' + ($counts -join ',')
