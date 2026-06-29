$ErrorActionPreference='Stop'
$base=$PSScriptRoot
$catjs=[IO.File]::ReadAllText((Join-Path $base '_catjs.txt'),[Text.Encoding]::UTF8)
$catcss=[IO.File]::ReadAllText((Join-Path $base '_catcss.txt'),[Text.Encoding]::UTF8)
# 1) JS: insert function + call in init()
$js=Join-Path $base 'js/custom-rebuild.js'
$t=[IO.File]::ReadAllText($js,[Text.Encoding]::UTF8)
$old='function init(){initGalleries();relocate();renderReviews();}'
$new=$catjs+"`r`n"+'function init(){initGalleries();relocate();renderReviews();initCatalogMobile();}'
$c=([regex]::Matches($t,[regex]::Escape($old))).Count
$t=$t.Replace($old,$new)
[IO.File]::WriteAllText($js,$t,(New-Object Text.UTF8Encoding($false)))
# 2) CSS append
$css=Join-Path $base 'css/custom-rebuild.css'
$ct=[IO.File]::ReadAllText($css,[Text.Encoding]::UTF8)
[IO.File]::WriteAllText($css,$ct+"`r`n"+$catcss,(New-Object Text.UTF8Encoding($false)))
# 3) cache bust v13 -> v14
$h=Join-Path $base 'index.html'
$ht=[IO.File]::ReadAllText($h,[Text.Encoding]::UTF8)
$cc=([regex]::Matches($ht,[regex]::Escape('custom-rebuild.css?v=13'))).Count
$cj=([regex]::Matches($ht,[regex]::Escape('custom-rebuild.js?v=13'))).Count
$ht=$ht.Replace('custom-rebuild.css?v=13','custom-rebuild.css?v=14').Replace('custom-rebuild.js?v=13','custom-rebuild.js?v=14')
[IO.File]::WriteAllText($h,$ht,(New-Object Text.UTF8Encoding($false)))
Write-Output ('init '+$c+' css '+$cc+' js '+$cj)
