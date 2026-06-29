$ErrorActionPreference='Stop'
$base=$PSScriptRoot
$t=[IO.File]::ReadAllText((Join-Path $base 'index.html'),[Text.Encoding]::UTF8)
$lines=$t -split "`n"
$nums=New-Object System.Collections.ArrayList
$first=-1
for($i=0;$i -lt $lines.Length;$i++){
  $L=$lines[$i]
  if($L -match 'pgal' -or $L -match 'data-art' -or $L -match 'prod-sale' -or $L -match 'catalog'){
    [void]$nums.Add(($i+1).ToString()+': '+$L.Trim())
    if($first -lt 0 -and ($L -match 'pgal' -or $L -match 'data-art')){$first=$i}
  }
}
[IO.File]::WriteAllLines((Join-Path $base '_scan.txt'),$nums,(New-Object Text.UTF8Encoding($false)))
$ctx=New-Object System.Collections.ArrayList
if($first -ge 0){
  $a=[Math]::Max(0,$first-40);$b=[Math]::Min($lines.Length-1,$first+30)
  for($j=$a;$j -le $b;$j++){[void]$ctx.Add(($j+1).ToString()+': '+$lines[$j])}
}
[IO.File]::WriteAllLines((Join-Path $base '_ctx.txt'),$ctx,(New-Object Text.UTF8Encoding($false)))
Write-Output ('hits '+$nums.Count+' first '+($first+1))
