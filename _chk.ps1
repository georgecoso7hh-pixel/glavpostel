$ErrorActionPreference='Stop'
$t=[IO.File]::ReadAllText('js/custom-rebuild.js',[Text.Encoding]::UTF8)
$lines=$t -split "`n"
for($i=0;$i -lt $lines.Length;$i++){
  if($lines[$i] -match 'background-image:url' -or $lines[$i] -match '<video src' -or $lines[$i] -match 'function bg'){
    [IO.File]::AppendAllText('_chk.txt',(($i+1).ToString()+': '+$lines[$i]+"`n"),(New-Object Text.UTF8Encoding($false)))
  }
}
Write-Output 'done'
