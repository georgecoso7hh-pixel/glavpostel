$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $c=([regex]::Matches($t,[regex]::Escape($old))).Count
  $t=$t.Replace($old,$new)
  [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
  return $c
}
$css='css/custom-rebuild.css'
$a=Repl $css '.rvm-objtitle{display:none;}' '.rvm-objtitle{display:inline-flex;align-self:flex-start;background:#fff3e8;border:1px solid #ffd2a6;color:#e8730c;font-weight:700;font-size:15px;padding:6px 13px;border-radius:9px;margin:4px 0 14px;}'
$h='index.html'
$d=Repl $h 'custom-rebuild.css?v=11' 'custom-rebuild.css?v=12'
$e=Repl $h 'custom-rebuild.js?v=11' 'custom-rebuild.js?v=12'
Write-Output ('objtitle '+$a+' css '+$d+' js '+$e)
