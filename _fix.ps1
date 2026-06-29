$ErrorActionPreference='Stop'
$p='js/custom-rebuild.js'
$t=[IO.File]::ReadAllText($p,[Text.Encoding]::UTF8)
$old='card.style.flexBasis="calc('
$new='card.style.flex="0 0 calc('
$cnt=0
if($t.Contains($old)){$t=$t.Replace($old,$new);$cnt++}
[IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding($false)))
Write-Output ('DONE '+$cnt)
