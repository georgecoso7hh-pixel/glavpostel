$ErrorActionPreference='Stop'
function Repl($path,$old,$new){
  $t=[IO.File]::ReadAllText($path,[Text.Encoding]::UTF8)
  if($t.Contains($old)){
    $t=$t.Replace($old,$new)
    [IO.File]::WriteAllText($path,$t,(New-Object Text.UTF8Encoding($false)))
    return 1
  } else { return 0 }
}

$css='css/custom-rebuild.css'
$cssOld='.plx-close{position:absolute;top:12px;right:18px;font-size:32px;cursor:pointer;line-height:1;z-index:3;color:#fff;text-shadow:0 1px 4px rgba(0,0,0,.6);}'
$cssNew='.plx-close{position:absolute;top:14px;right:16px;width:48px;height:48px;border-radius:50%;background:#fff;color:#e8312b;font-size:34px;font-weight:700;line-height:46px;text-align:center;cursor:pointer;z-index:6;box-shadow:0 3px 12px rgba(0,0,0,.22);transition:.15s;}'
$cssNew=$cssNew+"`n.plx-close:hover{background:#e8312b;color:#fff;transform:scale(1.06);}"
$c=Repl $css $cssOld $cssNew

$js='js/custom-rebuild.js'
$jsOld='plxBig=plxOv.querySelector("#plxBig");'
$jsNew='plxBig=plxOv.querySelector("#plxBig");plxBig.addEventListener("mousemove",function(e){var r=plxBig.getBoundingClientRect();var x=((e.clientX-r.left)/r.width)*100;var y=((e.clientY-r.top)/r.height)*100;plxBig.style.backgroundSize="230%";plxBig.style.backgroundPosition=x+"% "+y+"%";plxBig.style.cursor="zoom-in";});plxBig.addEventListener("mouseleave",function(){plxBig.style.backgroundSize="contain";plxBig.style.backgroundPosition="center";});'
$j=Repl $js $jsOld $jsNew

Write-Output ('CSS '+$c+' JS '+$j)
