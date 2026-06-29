$ErrorActionPreference='Stop'
$f='index.html'
$lines=Get-Content -LiteralPath $f
$pats=@('id="color"','action=','invoice','ajax','#order','maskedinput','serialize','.post(','.ajax(','name="name"','name="phone"','name="','<form','</form>','script.js','maskinput','metrika','reachGoal','goal','postback','subid','offer','data-art','data-imgs','products-item-fix','prod_s_but','prod-buttons','modal','color')
$out=New-Object System.Collections.Generic.List[string]
for($i=0;$i -lt $lines.Count;$i++){
  foreach($p in $pats){
    if($lines[$i].Contains($p)){ $out.Add((($i+1).ToString()+': '+$lines[$i])); break }
  }
}
[IO.File]::WriteAllLines((Join-Path (Get-Location) '_scan_order.txt'),$out,[Text.UTF8Encoding]::new($false))
Write-Output ('LINES='+$lines.Count+' HITS='+$out.Count)
