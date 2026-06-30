$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$cf='css/custom-rebuild.css'
$c=[System.IO.File]::ReadAllText($cf)
$a="body{font-family:'Manrope',-apple-system,'Segoe UI',Roboto,Arial,sans-serif !important;}"
$b=".title,.rv-h-title{font-family:'Cormorant','Playfair Display',Georgia,serif !important;letter-spacing:.4px;}"
$c=$c.Replace($a,'/* v28: reverted body font to site default */')
$c=$c.Replace($b,'/* v28: reverted heading font to site default */')
[System.IO.File]::WriteAllText($cf,$c,$enc)
$hf='index.html'
$h=[System.IO.File]::ReadAllText($hf)
$h=[regex]::Replace($h,'custom-rebuild\.css\?v=\d+','custom-rebuild.css?v=28')
[System.IO.File]::WriteAllText($hf,$h,$enc)
Write-Output ('manrope='+([regex]::Matches($c,'Manrope')).Count+' cormorant='+([regex]::Matches($c,'Cormorant')).Count+' csshtml='+([regex]::Matches($h,[regex]::Escape('custom-rebuild.css?v=28'))).Count)
