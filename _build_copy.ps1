$ErrorActionPreference='Stop'
$pdst='photos'
$rdst='reviews'
New-Item -ItemType Directory -Force -Path $pdst | Out-Null
New-Item -ItemType Directory -Force -Path $rdst | Out-Null
$psrc='..\' + [string]::Join('',[char[]](0x413,0x43E,0x442,0x43E,0x432,0x44B,0x435,0x20,0x444,0x43E,0x442,0x43E))
$rsrc='..\' + [string]::Join('',[char[]](0x41E,0x442,0x437,0x44B,0x432,0x44B))
$man=New-Object System.Collections.ArrayList

for($n=1;$n -le 38;$n++){
  $ordered=@()
  $main=Join-Path $psrc ('{0}.png' -f $n)
  if(Test-Path $main){$ordered+=(Get-Item $main).FullName}
  $extras=Get-ChildItem -File $psrc | Where-Object {$_.Name -match ('^{0} \((\d+)\)\.png$' -f $n)} | Sort-Object {[int]([regex]::Match($_.Name,'\((\d+)\)').Groups[1].Value)}
  foreach($e in $extras){$ordered+=$e.FullName}
  $i=1
  foreach($p in ($ordered | Select-Object -First 3)){ Copy-Item $p (Join-Path $pdst ('{0}-{1}.png' -f $n,$i)) -Force; $i++ }
  [void]$man.Add(('P{0} count={1}' -f $n,([math]::Min($ordered.Count,3))))
}

for($n=1;$n -le 17;$n++){
  $ordered=@()
  $main=Join-Path $rsrc ('{0}.png' -f $n)
  if(Test-Path $main){$ordered+=(Get-Item $main).FullName}
  $extras=Get-ChildItem -File $rsrc | Where-Object {$_.Name -match ('^{0} \((\d+)\)\.png$' -f $n)} | Sort-Object {[int]([regex]::Match($_.Name,'\((\d+)\)').Groups[1].Value)}
  foreach($e in $extras){$ordered+=$e.FullName}
  $i=1
  foreach($p in $ordered){ Copy-Item $p (Join-Path $rdst ('r{0}-{1}.png' -f $n,$i)) -Force; $i++ }
  $vid=Get-ChildItem -File $rsrc | Where-Object {$_.Name -match ('^{0} \(.*\)\.mp4$' -f $n)}
  $hasv='-'
  if($vid){ Copy-Item $vid[0].FullName (Join-Path $rdst ('r{0}.mp4' -f $n)) -Force; $hasv='video' }
  [void]$man.Add(('R{0} photos={1} {2}' -f $n,$ordered.Count,$hasv))
}
[IO.File]::WriteAllLines((Join-Path (Get-Location) '_manifest.txt'),$man,[Text.Encoding]::UTF8)
Write-Output 'COPY DONE'
