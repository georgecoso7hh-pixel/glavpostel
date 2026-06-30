$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$js='js\custom-rebuild.js'
$add=@'

/* v31: force correct per-card artikul in order modal header on every open path */
(function(){
  function artFromCard(card){ if(!card||!card.querySelector)return ""; var g=card.querySelector(".pgal"); return (g&&g.getAttribute("data-art"))||""; }
  function curArt(trigger){
    var ov=document.querySelector(".plx-overlay.open");
    if(ov&&ov.getAttribute("data-art"))return ov.getAttribute("data-art");
    var card=trigger&&trigger.closest&&trigger.closest(".products-item");
    return artFromCard(card);
  }
  function applyArt(art){
    if(!art)return;
    var nodes=document.querySelectorAll("[id='name']");
    Array.prototype.forEach.call(nodes,function(nm){
      nm.innerHTML='<span class="ord-art">\u0410\u0440\u0442\u0438\u043a\u0443\u043b: '+art+'</span>';
    });
  }
  document.addEventListener("click",function(e){
    if(!e.isTrusted)return;
    var t=e.target&&e.target.closest&&e.target.closest("#sat_ordering, #plxBuy, .plx-buy, .products-item");
    if(!t)return;
    var art=curArt(t);
    if(art)window.__lastArt=art;
    if(!window.__lastArt)return;
    [20,120,260,500,900,1400].forEach(function(ms){setTimeout(function(){applyArt(window.__lastArt);},ms);});
  },true);
})();
'@
$c=[System.IO.File]::ReadAllText($js,$enc)
if($c -notmatch 'v31: force correct per-card artikul'){ [System.IO.File]::WriteAllText($js,$c+$add,$enc) }
$idx='index.html'
$h=[System.IO.File]::ReadAllText($idx,$enc)
$h=[regex]::Replace($h,'custom-rebuild\.js\?v=\d+','custom-rebuild.js?v=31')
[System.IO.File]::WriteAllText($idx,$h,$enc)
$c2=[System.IO.File]::ReadAllText($js,$enc)
$h2=[System.IO.File]::ReadAllText($idx,$enc)
$n=([regex]::Matches($c2,'v31: force correct per-card artikul')).Count
$v=([regex]::Matches($h2,'custom-rebuild\.js\?v=31')).Count
'v31={0} jsv31={1}' -f $n,$v
