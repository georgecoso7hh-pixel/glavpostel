$ErrorActionPreference='Stop'
$p='index.html'
$t=[IO.File]::ReadAllText($p,[Text.Encoding]::UTF8)
$t=$t.Replace('css/custom-rebuild.css?v=7','css/custom-rebuild.css')
$t=$t.Replace('js/custom-rebuild.js?v=7','js/custom-rebuild.js')
$t=$t.Replace('css/custom-rebuild.css"','css/custom-rebuild.css?v=8"')
$t=$t.Replace('js/custom-rebuild.js"','js/custom-rebuild.js?v=8"')
[IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding($false)))
$css=([regex]::Matches($t,'custom-rebuild\.css\?v=8')).Count
$js=([regex]::Matches($t,'custom-rebuild\.js\?v=8')).Count
Write-Output ('CSS '+$css+' JS '+$js)
