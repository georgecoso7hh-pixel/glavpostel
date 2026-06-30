$ErrorActionPreference='Stop'
$enc=New-Object System.Text.UTF8Encoding($false)
$js='js\custom-rebuild.js'
$add=@'

/* v30: open product lightbox (plx) on whole-card click; disable legacy #ordering overlay */
(function(){
  function bindCardOpen(){
    Array.prototype.forEach.call(document.querySelectorAll(".products-item"),function(card){
      if(card.getAttribute("data-cardopen"))return;
      card.setAttribute("data-cardopen","1");
      var fl=card.querySelector(".full-link");
      if(fl){fl.style.pointerEvents="none";}
      card.addEventListener("click",function(e){
        if(e.target.closest(".prod-buttons, .pgal, a, button"))return;
        var main=card.querySelector(".pgal__main");
        if(main){main.click();}
      });
    });
  }
  function run(){bindCardOpen();setTimeout(bindCardOpen,400);}
  if(document.readyState==="loading"){document.addEventListener("DOMContentLoaded",run);}else{run();}
})();
'@
$c=[System.IO.File]::ReadAllText($js,$enc)
if($c -notmatch 'v30: open product lightbox'){ [System.IO.File]::WriteAllText($js,$c+$add,$enc) }
$idx='index.html'
$h=[System.IO.File]::ReadAllText($idx,$enc)
$h=[regex]::Replace($h,'custom-rebuild\.js\?v=\d+','custom-rebuild.js?v=30')
[System.IO.File]::WriteAllText($idx,$h,$enc)
$c2=[System.IO.File]::ReadAllText($js,$enc)
$h2=[System.IO.File]::ReadAllText($idx,$enc)
$n=([regex]::Matches($c2,'v30: open product lightbox')).Count
$v=([regex]::Matches($h2,'custom-rebuild\.js\?v=30')).Count
'cardopen={0} jsv30={1}' -f $n,$v
