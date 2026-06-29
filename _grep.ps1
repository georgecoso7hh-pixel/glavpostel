$base=Get-Location
$css=[IO.File]::ReadAllLines((Join-Path $base 'css\style.css'),[Text.Encoding]::UTF8)
$o=New-Object System.Collections.ArrayList
[void]$o.Add('TOTAL_LINES='+$css.Count)
for($i=0;$i -lt $css.Count;$i++){
  if($css[$i] -match 'full-link|prod-sale|prod-image|products-item'){
    $end=[Math]::Min($i+16,$css.Count)
    for($j=$i;$j -lt $end;$j++){ [void]$o.Add(($j+1).ToString()+': '+$css[$j]); if($css[$j] -match '\}'){break} }
    [void]$o.Add('----')
  }
}
[IO.File]::WriteAllLines((Join-Path $base '_grep.txt'),$o,[Text.Encoding]::UTF8)
Write-Output 'GREP DONE'
