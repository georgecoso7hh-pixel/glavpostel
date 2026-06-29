$base=Get-Location
$t=[IO.File]::ReadAllText((Join-Path $base 'index.html'),[Text.Encoding]::UTF8)
$o=New-Object System.Collections.ArrayList
[void]$o.Add('pgal='+([regex]::Matches($t,'class="pgal"')).Count)
[void]$o.Add('rvRoot='+([regex]::Matches($t,'id="rvRoot"')).Count)
[void]$o.Add('cssLink='+([regex]::Matches($t,'css/custom-rebuild\.css')).Count)
[void]$o.Add('jsLink='+([regex]::Matches($t,'js/custom-rebuild\.js')).Count)
[void]$o.Add('oldCatalogBg='+([regex]::Matches($t,'prod-image__bg')).Count)
[void]$o.Add('oldReviewsItem='+([regex]::Matches($t,'reviews-item-fix')).Count)
$m=[regex]::Matches($t,'(?s)<div class="title">.*?</div>')
$i=0
foreach($x in $m){ [void]$o.Add('title['+$i+']='+$x.Value); $i++ }
$g=[regex]::Match($t,'<div class="pgal"[^>]*></div>')
[void]$o.Add('sampleGal='+$g.Value)
[IO.File]::WriteAllLines((Join-Path $base '_check.txt'),$o,[Text.Encoding]::UTF8)
Write-Output 'CHECK DONE'
