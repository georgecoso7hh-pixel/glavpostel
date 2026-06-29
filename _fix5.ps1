$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $c=([regex]::Matches($t,[regex]::Escape($old))).Count
  $t=$t.Replace($old,$new)
  [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
  return $c
}
$css='css/custom-rebuild.css'
$a=Repl $css 'height:404px;' 'min-height:0;'
$b=Repl $css '.rv-pros{color:#3d3d3d;font-size:15px;line-height:1.55;display:-webkit-box;-webkit-line-clamp:5;-webkit-box-orient:vertical;overflow:hidden;}' '.rv-pros{color:#3d3d3d;font-size:15px;line-height:1.55;}'
$h='index.html'
$d=Repl $h 'custom-rebuild.css?v=9' 'custom-rebuild.css?v=10'
$e=Repl $h 'custom-rebuild.js?v=9' 'custom-rebuild.js?v=10'
Write-Output ('card '+$a+' pros '+$b+' css '+$d+' js '+$e)
