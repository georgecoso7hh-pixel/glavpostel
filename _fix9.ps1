$ErrorActionPreference='Stop'
$d=[IO.File]::ReadAllText('_rep.txt',[Text.Encoding]::UTF8)
$p=$d -split '~~~SPLIT~~~'
$o1=$p[0].Trim();$n1=$p[1].Trim();$o2=$p[2].Trim();$n2=$p[3].Trim()
$js='js/custom-rebuild.js'
$t=[IO.File]::ReadAllText($js,[Text.Encoding]::UTF8)
$c1=([regex]::Matches($t,[regex]::Escape($o1))).Count
$t=$t.Replace($o1,$n1)
$c2=([regex]::Matches($t,[regex]::Escape($o2))).Count
$t=$t.Replace($o2,$n2)
[IO.File]::WriteAllText($js,$t,(New-Object Text.UTF8Encoding($false)))
Write-Output ('bg '+$c1+' video '+$c2)
