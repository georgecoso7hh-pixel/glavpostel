$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  $c=([regex]::Matches($t,[regex]::Escape($old))).Count
  $t=$t.Replace($old,$new)
  [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
  return $c
}
$js='js/custom-rebuild.js'
$a=Repl $js 'function bg(u){return "background-image:url('+[char]39+'"+u+"'+[char]39+')";}' ('function bg(u){return "background-image:url('+[char]39+'"+u+"?v=13'+[char]39+')";}')
$b=Repl $js '<video src="'+[char]39+'+m.src+'+[char]39+'" controls' ('<video src="'+[char]39+'+m.src+"?v=13"+'+[char]39+'" controls')
$h='index.html'
$d=Repl $h 'custom-rebuild.css?v=12' 'custom-rebuild.css?v=13'
$e=Repl $h 'custom-rebuild.js?v=12' 'custom-rebuild.js?v=13'
Write-Output ('bg '+$a+' video '+$b+' css '+$d+' js '+$e)
