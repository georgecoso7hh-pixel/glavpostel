$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)

$cf='css/custom-rebuild.css'
$c=[System.IO.File]::ReadAllText($cf)
$cssAdd=@'

/* ===== reviews v23: orange next arrow, hide count, mobile dots ===== */
.rv-rate .cnt{display:none !important;}
.rv-arrow.next{background:#e8730c !important;color:#fff !important;box-shadow:0 5px 18px rgba(232,115,12,.55) !important;}
.rv-arrow.next:hover{background:#cf6207 !important;}
.rv-arrow.next[disabled]{background:#f0c39a !important;color:#fff !important;box-shadow:none !important;}
@media(max-width:560px){
.rv-pages{gap:7px;margin-top:16px;align-items:center;}
.rv-page{width:9px;height:9px;min-width:0;padding:0;border-radius:50%;font-size:0;line-height:0;overflow:hidden;border:1px solid #d8d8d8;background:#fff;}
.rv-page.act{width:22px;height:9px;border-radius:6px;background:#e8730c;border-color:#e8730c;}
}
'@
if($c.IndexOf('reviews v23') -lt 0){ $c=$c+$cssAdd; [System.IO.File]::WriteAllText($cf,$c,$enc) }

$jf='js/custom-rebuild.js'
$j=[System.IO.File]::ReadAllText($jf)
$anchor='arrNext.onclick=function(){go(curPage+1);};'
$swipeAdd=@"

 var _tsx=0,_tsy=0,_tsw=false;
 viewport.addEventListener("touchstart",function(e){var t=e.changedTouches[0];_tsx=t.clientX;_tsy=t.clientY;_tsw=false;},{passive:true});
 viewport.addEventListener("touchmove",function(e){if(_tsw)return;var t=e.changedTouches[0];var dx=t.clientX-_tsx,dy=t.clientY-_tsy;if(Math.abs(dx)>40&&Math.abs(dx)>Math.abs(dy)){_tsw=true;go(curPage+(dx<0?1:-1));}},{passive:true});
"@
if($j.IndexOf('_tsw') -lt 0){ $j=$j.Replace($anchor,$anchor+$swipeAdd); [System.IO.File]::WriteAllText($jf,$j,$enc) }

$hf='index.html'
$h=[System.IO.File]::ReadAllText($hf)
$h=[regex]::Replace($h,'custom-rebuild\.css\?v=\d+','custom-rebuild.css?v=23')
$h=[regex]::Replace($h,'custom-rebuild\.js\?v=\d+','custom-rebuild.js?v=23')
[System.IO.File]::WriteAllText($hf,$h,$enc)

Write-Output ('CSSv23='+([regex]::Matches($c,'reviews v23')).Count+' JSswipe='+([regex]::Matches($j,'_tsw')).Count+' CSShtml='+([regex]::Matches($h,[regex]::Escape('custom-rebuild.css?v=23'))).Count+' JShtml='+([regex]::Matches($h,[regex]::Escape('custom-rebuild.js?v=23'))).Count)
