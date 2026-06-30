$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$cf='css/custom-rebuild.css'
$c=[System.IO.File]::ReadAllText($cf)
$add=@'

/* ===== v27: equalize & center product card buttons ===== */
.prod-buttons{display:flex !important;flex-direction:column !important;align-items:center !important;gap:12px !important;margin-top:18px !important;}
.prod-buttons .item{display:flex !important;justify-content:center !important;width:100% !important;max-width:300px !important;margin:0 !important;float:none !important;}
.prod-buttons .item a{display:flex !important;align-items:center;justify-content:center;gap:8px;width:100% !important;max-width:100% !important;margin:0 !important;box-sizing:border-box !important;border-radius:10px !important;padding:13px 18px !important;white-space:nowrap;text-align:center;}
.prod-buttons .to-reviews{font-size:17px;}
'@
if($c.IndexOf('v27: equalize') -lt 0){ $c=$c+$add; [System.IO.File]::WriteAllText($cf,$c,$enc) }
$hf='index.html'
$h=[System.IO.File]::ReadAllText($hf)
$h=[regex]::Replace($h,'custom-rebuild\.css\?v=\d+','custom-rebuild.css?v=27')
[System.IO.File]::WriteAllText($hf,$h,$enc)
Write-Output ('v27='+([regex]::Matches($c,'v27: equalize')).Count+' csshtml='+([regex]::Matches($h,[regex]::Escape('custom-rebuild.css?v=27'))).Count)
