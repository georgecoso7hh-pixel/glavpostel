$ErrorActionPreference='Stop'

# --- 1) JS: show per-card artikul in #order form ---
$jf='js\custom-rebuild.js'
$j=[System.IO.File]::ReadAllText($jf)
$j=$j.Replace('function doOrder(art){','function setOrderInfo(art){var nm=document.getElementById("name");if(nm&&art){nm.innerHTML=''<span class="ord-art">\u0410\u0440\u0442\u0438\u043a\u0443\u043b: ''+art+''</span>'';}var pr=document.getElementById("price");if(pr){pr.textContent=''2290 \u0440\u0443\u0431'';}}function doOrder(art){')
$j=$j.Replace('if(t){t.click();}else{location.hash="#order";}','if(t){t.click();}else{location.hash="#order";}setOrderInfo(art);setTimeout(function(){setOrderInfo(art);},80);setTimeout(function(){setOrderInfo(art);},260);')
[System.IO.File]::WriteAllText($jf,$j,(New-Object System.Text.UTF8Encoding($false)))
$jc=([regex]::Matches($j,'setOrderInfo')).Count

# --- 2) CSS: restore pre-session base + clean #order layout ---
$cssf='css\custom-rebuild.css'
$cssbak='css\custom-rebuild.css.bak'
$base=[System.IO.File]::ReadAllText($cssbak)
$add=@"

/* ===== order modal v22: single column, no branding banner, per-card artikul ===== */
#order{width:auto !important;max-width:520px;margin:0 auto;box-sizing:border-box;}
#order .box_oder_image{display:none !important;}
#order .box_order_info{display:block !important;width:100% !important;box-sizing:border-box;padding:16px !important;}
#order .box_order_title{text-align:center;font-weight:700;font-size:20px;margin-bottom:10px;}
#order .box_order_img{display:block !important;width:100% !important;}
#order .box_order_img .block.clear{display:block !important;width:100% !important;text-align:center;margin-bottom:8px;}
#order .info{display:block !important;width:100% !important;}
#order #name{display:block;text-align:center;margin-bottom:6px;min-height:0;}
.ord-art{display:inline-block;background:#e8730c;color:#fff;font-weight:700;font-size:16px;padding:6px 14px;border-radius:8px;letter-spacing:.3px;}
#order .price{text-align:center;font-size:16px;margin:4px 0 12px;font-weight:700;}
#order .price .gray{font-weight:400;color:#888;}
#order .lead-iframe-wrap iframe{width:100% !important;min-height:470px;}
@media (max-width:560px){#order{max-width:96vw;}#order .box_order_info{padding:12px !important;}#order .lead-iframe-wrap iframe{min-height:510px;}}
"@
[System.IO.File]::WriteAllText($cssf,$base+$add,(New-Object System.Text.UTF8Encoding($false)))
$csslen=($base.Length+$add.Length)

# --- 3) bump cache versions in index.html ---
$hf='index.html'
$h=[System.IO.File]::ReadAllText($hf)
$h=$h.Replace('custom-rebuild.css?v=21','custom-rebuild.css?v=22')
$h=$h.Replace('custom-rebuild.js?v=20','custom-rebuild.js?v=22')
[System.IO.File]::WriteAllText($hf,$h,(New-Object System.Text.UTF8Encoding($false)))
$vc=([regex]::Matches($h,'\?v=22')).Count

Write-Output ('RESULT JS_setOrderInfo='+$jc+' CSS_bytes='+$csslen+' VER_v22='+$vc)
