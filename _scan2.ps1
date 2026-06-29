$ErrorActionPreference='Stop'
$base=$PSScriptRoot
$out=Join-Path $base '_scan2.txt'
$lines=[IO.File]::ReadAllLines((Join-Path $base 'index.html'),[Text.Encoding]::UTF8)
$res=New-Object System.Collections.Generic.List[string]
for($i=0;$i -lt $lines.Length;$i++){
  $l=$lines[$i]
  if($l -match '45' -or $l -match '(?i)sale' -or $l -match '(?i)shar' -or $l -match '(?i)ball' -or $l -match '(?i)skidk' -or $l -match '(?i)akci' -or $l -match '(?i)discount' -or $l -match '(?i)stiker' -or $l -match '(?i)sticker' -or $l -match '(?i)label'){
    $res.Add(($i+1).ToString()+': '+$l.Trim())
  }
}
[IO.File]::WriteAllText($out,($res -join "`r`n"),(New-Object Text.UTF8Encoding($false)))
Write-Output ('hits '+$res.Count)
