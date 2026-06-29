$ErrorActionPreference='Stop'
$base=$PSScriptRoot
$oldblk=[IO.File]::ReadAllText((Join-Path $base '_f11js.txt'),[Text.Encoding]::UTF8)
$newblk=[IO.File]::ReadAllText((Join-Path $base '_f12js.txt'),[Text.Encoding]::UTF8)
$fcss=[IO.File]::ReadAllText((Join-Path $base '_f12css.txt'),[Text.Encoding]::UTF8)
# 1) JS: swap old function block -> new, and update init() calls
$js=Join-Path $base 'js/custom-rebuild.js'
$t=[IO.File]::ReadAllText($js,[Text.Encoding]::UTF8)
$b=([regex]::Matches($t,[regex]::Escape($oldblk))).Count
$t=$t.Replace($oldblk,$newblk)
$oldinit='function init(){initGalleries();relocate();renderReviews();initReviewButtons();initScrollRibbon();}'
$newinit='function init(){initGalleries();relocate();renderReviews();initReviewButtons();initShowMore();}'
$i=([regex]::Matches($t,[regex]::Escape($oldinit))).Count
$t=$t.Replace($oldinit,$newinit)
[IO.File]::WriteAllText($js,$t,(New-Object Text.UTF8Encoding($false)))
# 2) CSS append
$css=Join-Path $base 'css/custom-rebuild.css'
$ct=[IO.File]::ReadAllText($css,[Text.Encoding]::UTF8)
[IO.File]::WriteAllText($css,$ct+"`r`n"+$fcss,(New-Object Text.UTF8Encoding($false)))
# 3) cache bust -> v16
$h=Join-Path $base 'index.html'
$ht=[IO.File]::ReadAllText($h,[Text.Encoding]::UTF8)
$ht=[regex]::Replace($ht,'custom-rebuild\.css\?v=\d+','custom-rebuild.css?v=16')
$ht=[regex]::Replace($ht,'custom-rebuild\.js\?v=\d+','custom-rebuild.js?v=16')
[IO.File]::WriteAllText($h,$ht,(New-Object Text.UTF8Encoding($false)))
Write-Output ('block '+$b+' init '+$i)
