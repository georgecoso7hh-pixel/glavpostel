$ErrorActionPreference='Stop'
# Cyrillic built from codepoints to keep this file pure ASCII
$otz=[string]::Concat([char]0x41E,[char]0x442,[char]0x437,[char]0x44B,[char]0x432,[char]0x44B)   # Otzyvy
$vid=[string]::Concat([char]0x432,[char]0x438,[char]0x434,[char]0x435,[char]0x43E)               # video
$src=Join-Path '..' $otz
$dst='reviews'
if(-not (Test-Path $dst)){New-Item -ItemType Directory -Path $dst | Out-Null}

$pairs=@(
 @('1.png','r1-1.png'),
 @('1 (1).png','r1-2.png'),
 @('2.png','r2-1.png'),
 @('3 (1).png','r3-1.png'),
 @('3 (2).png','r3-2.png'),
 @('4 (1).png','r4-1.png'),
 @('5 (1).png','r5-1.png'),
 @('5 (2).png','r5-2.png'),
 @('6.png','r6-1.png'),
 @('7.png','r7-1.png'),
 @('8.png','r8-1.png'),
 @('9.png','r9-1.png'),
 @('10.png','r10-1.png'),
 @('11.png','r11-1.png'),
 @('12.png','r12-1.png'),
 @('13.png','r13-1.png'),
 @('14.png','r14-1.png'),
 @('15.png','r15-1.png'),
 @('16.png','r16-1.png'),
 @('17.png','r17-1.png')
)
$n=0
foreach($p in $pairs){
 $s=Join-Path $src $p[0]
 if(Test-Path $s){Copy-Item $s (Join-Path $dst $p[1]) -Force; $n++}
 else{Write-Output ('MISSING: '+$p[0])}
}
$vfiles=@(@('1','r1.mp4'),@('4','r4.mp4'),@('9','r9.mp4'),@('15','r15.mp4'))
$nv=0
foreach($v in $vfiles){
 $sname=$v[0]+' ('+$vid+').mp4'
 $s=Join-Path $src $sname
 if(Test-Path $s){Copy-Item $s (Join-Path $dst $v[1]) -Force; $nv++}
 else{Write-Output ('MISSING VIDEO: '+$sname)}
}
Write-Output ('photos '+$n+' videos '+$nv)
