$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $c=([regex]::Matches($t,[regex]::Escape($old))).Count
  $t=$t.Replace($old,$new)
  [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
  return $c
}
$css='css/custom-rebuild.css'
$a=Repl $css 'height:452px;' 'height:404px;'
$b=Repl $css 'height:230px;flex:0 0 230px;' 'height:208px;flex:0 0 208px;'
$c=Repl $css '.rv-body{padding:16px 17px 18px;display:flex;flex-direction:column;gap:9px;flex:1;}' '.rv-body{padding:13px 16px 14px;display:flex;flex-direction:column;gap:7px;flex:1;}'
$h='index.html'
$d=Repl $h 'custom-rebuild.css?v=8' 'custom-rebuild.css?v=9'
$e=Repl $h 'custom-rebuild.js?v=8' 'custom-rebuild.js?v=9'
Write-Output ('card '+$a+' cover '+$b+' body '+$c+' css '+$d+' js '+$e)
