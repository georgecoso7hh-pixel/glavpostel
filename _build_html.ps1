$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$base=Get-Location
$f=Join-Path $base 'index.html'
$t=[IO.File]::ReadAllText($f,[Text.Encoding]::UTF8)

[IO.File]::WriteAllText((Join-Path $base 'index.html.bak'),$t,$enc)

$h=([IO.File]::ReadAllText((Join-Path $base '_h.txt'),[Text.Encoding]::UTF8)).Trim()

$galRe=New-Object System.Text.RegularExpressions.Regex('<div class="prod-image__bg" style="background-image:url\(catalog/(\d+)\.jpg\);?[^"]*"></div>')
$galCount=$galRe.Matches($t).Count
$t=$galRe.Replace($t,{param($m) $n=$m.Groups[1].Value; '<div class="pgal" data-art="'+$n+'" data-imgs="photos/'+$n+'-1.png,photos/'+$n+'-2.png,photos/'+$n+'-3.png"></div>'})

$headRe=New-Object System.Text.RegularExpressions.Regex('<div class="title">[^<]*<br\s*/?>[^<]*</div>')
$headCount=$headRe.Matches($t).Count
$t=$headRe.Replace($t,('<div class="title">'+$h+'</div>'),1)

$revRe=New-Object System.Text.RegularExpressions.Regex('(?s)<div class="reviews-item-fix">.*?videos/3\.mp4.*?</video>\s*</div>\s*</div>\s*</div>\s*</div>')
$revCount=$revRe.Matches($t).Count
$t=$revRe.Replace($t,'<div class="rv-grid" id="rvRoot"></div>',1)

$cssCount=0
if($t -notmatch 'css/custom-rebuild\.css'){
  $cre=New-Object System.Text.RegularExpressions.Regex('</head>')
  $t=$cre.Replace($t,'<link rel="stylesheet" href="css/custom-rebuild.css"></head>',1)
  $cssCount=1
}

$jsCount=0
if($t -notmatch 'js/custom-rebuild\.js'){
  $jre=New-Object System.Text.RegularExpressions.Regex('</body>')
  $t=$jre.Replace($t,'<script src="js/custom-rebuild.js"></script></body>',1)
  $jsCount=1
}

[IO.File]::WriteAllText($f,$t,$enc)
Write-Output ('GAL='+$galCount+' HEAD='+$headCount+' REV='+$revCount+' CSS='+$cssCount+' JS='+$jsCount)
