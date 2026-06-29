$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $c=([regex]::Matches($t,[regex]::Escape($old))).Count
  $t=$t.Replace($old,$new)
  [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
  return $c
}
$css='css/custom-rebuild.css'
$a=Repl $css '.rvm-objtitle{font-weight:700;font-size:19px;color:#222;margin:2px 0 12px;}' '.rvm-objtitle{display:none;}'
$h='index.html'
$d=Repl $h 'custom-rebuild.css?v=10' 'custom-rebuild.css?v=11'
$e=Repl $h 'custom-rebuild.js?v=10' 'custom-rebuild.js?v=11'
Write-Output ('objtitle '+$a+' css '+$d+' js '+$e)
