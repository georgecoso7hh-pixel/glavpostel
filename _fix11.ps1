$ErrorActionPreference='Stop'
$base=$PSScriptRoot
$fjs=[IO.File]::ReadAllText((Join-Path $base '_f11js.txt'),[Text.Encoding]::UTF8)
$fcss=[IO.File]::ReadAllText((Join-Path $base '_f11css.txt'),[Text.Encoding]::UTF8)
# 1) JS: insert functions + calls in init()
$js=Join-Path $base 'js/custom-rebuild.js'
$t=[IO.File]::ReadAllText($js,[Text.Encoding]::UTF8)
$old='function init(){initGalleries();relocate();renderReviews();}'
$new=$fjs+"`r`n"+'function init(){initGalleries();relocate();renderReviews();initReviewButtons();initScrollRibbon();}'
$c=([regex]::Matches($t,[regex]::Escape($old))).Count
$t=$t.Replace($old,$new)
[IO.File]::WriteAllText($js,$t,(New-Object Text.UTF8Encoding($false)))
# 2) CSS append
$css=Join-Path $base 'css/custom-rebuild.css'
$ct=[IO.File]::ReadAllText($css,[Text.Encoding]::UTF8)
[IO.File]::WriteAllText($css,$ct+"`r`n"+$fcss,(New-Object Text.UTF8Encoding($false)))
# 3) cache bust any current -> v15
$h=Join-Path $base 'index.html'
$ht=[IO.File]::ReadAllText($h,[Text.Encoding]::UTF8)
$cc=([regex]::Matches($ht,'custom-rebuild\.css\?v=\d+')).Count
$cj=([regex]::Matches($ht,'custom-rebuild\.js\?v=\d+')).Count
$ht=[regex]::Replace($ht,'custom-rebuild\.css\?v=\d+','custom-rebuild.css?v=15')
$ht=[regex]::Replace($ht,'custom-rebuild\.js\?v=\d+','custom-rebuild.js?v=15')
[IO.File]::WriteAllText($h,$ht,(New-Object Text.UTF8Encoding($false)))
Write-Output ('init '+$c+' css '+$cc+' js '+$cj)
