(function(){
"use strict";

/* ===================== ДАННЫЕ ОТЗЫВОВ ===================== */
var REVIEWS=[
 {art:1,name:"Ольга",city:"Краснодар",date:"14 марта 2025",rating:5,
  pros:"Сатин плотный, приятный к телу, совсем не электризуется. После стирки не полинял и не сел.",cons:"",
  comment:"Упаковано аккуратно, доставили быстро. Очень довольна!",
  reply:"Ольга, спасибо за подробный отзыв и видео! Рады, что комплект порадовал. Ждём Вас снова!",
  photos:["reviews/r1-1.png","reviews/r1-2.png"],video:"reviews/r1.mp4"},

 {art:2,name:"Марина",city:"Ростов-на-Дону",date:"2 февраля 2025",rating:5,
  pros:"Ткань мягкая, цвет ровно как на фото.",cons:"",
  comment:"Спим теперь всей семьёй только на таком.",
  reply:"Марина, благодарим за отзыв! Приятных снов.",
  photos:["reviews/r2-1.png"],video:null},

 {art:37,name:"Светлана",city:"Воронеж",date:"19 января 2025",rating:4,
  pros:"Сатин действительно качественный, бельё плотное.",cons:"Доставку ждала чуть дольше, чем рассчитывала.",
  comment:"Но результат того стоил.",
  reply:"Светлана, спасибо! Учтём замечание по срокам — уже работаем над ускорением доставки.",
  photos:["reviews/r3-1.png","reviews/r3-2.png"],video:null},

 {art:21,name:"Екатерина",city:"Краснодар",date:"28 февраля 2025",rating:5,
  pros:"Шов ровный, наволочки с запахом, ткань шикарная за такую цену.",cons:"",
  comment:"Муж оценил. Сняла видео, чтобы было видно качество.",
  reply:"Екатерина, спасибо за видеоотзыв! Очень приятно.",
  photos:["reviews/r4-1.png"],video:"reviews/r4.mp4"},

 {art:29,name:"Анна",city:"Самара",date:"7 марта 2025",rating:5,
  pros:"Бельё плотное, цвет благородный, упаковка подарочная.",cons:"",
  comment:"Брала в подарок маме — она в восторге!",
  reply:"Анна, спасибо! Передавайте маме наилучшие пожелания!",
  photos:["reviews/r5-1.png","reviews/r5-2.png"],video:null},

 {art:27,name:"Ирина",city:"Казань",date:"21 декабря 2024",rating:5,
  pros:"Отличный сатин, не скользит и почти не мнётся.",cons:"",
  comment:"Заказала уже второй комплект.",
  reply:"Ирина, спасибо за доверие и повторный заказ!",
  photos:["reviews/r6-1.png"],video:null},

 {art:25,name:"Наталья",city:"Уфа",date:"11 января 2025",rating:4,
  pros:"Качество хорошее, соответствует описанию.",cons:"Цвет чуть темнее, чем на картинке.",
  comment:"Но мне даже больше нравится.",
  reply:"Наталья, благодарим за честный отзыв!",
  photos:["reviews/r7-1.png"],video:null},

 {art:23,name:"Татьяна",city:"Сочи",date:"3 марта 2025",rating:5,
  pros:"Приятный материал, быстрая доставка.",cons:"",
  comment:"Сплю теперь как в облаке.",
  reply:"Татьяна, сладких снов! Спасибо, что выбрали нас.",
  photos:["reviews/r8-1.png"],video:null},

 {art:20,name:"Юлия",city:"Нижний Новгород",date:"16 февраля 2025",rating:5,
  pros:"Сатин гладкий, дышит, летом не жарко.",cons:"",
  comment:"Долго выбирала и не пожалела. Записала видео распаковки.",
  reply:"Юлия, спасибо за видео и тёплые слова!",
  photos:["reviews/r9-1.png"],video:"reviews/r9.mp4"},

 {art:13,name:"Виктория",city:"Пермь",date:"24 декабря 2024",rating:5,
  pros:"Ткань плотная, швы аккуратные.",cons:"",
  comment:"Комплект супер, рекомендую!",
  reply:"Виктория, спасибо за рекомендацию!",
  photos:["reviews/r10-1.png"],video:null},

 {art:6,name:"Людмила",city:"Волгоград",date:"9 января 2025",rating:4,
  pros:"Бельё приятное к телу, хорошее.",cons:"Немного помялось при пересылке.",
  comment:"После глажки всё отлично.",
  reply:"Людмила, спасибо! Рады, что всё в порядке.",
  photos:["reviews/r11-1.png"],video:null},

 {art:5,name:"Оксана",city:"Саратов",date:"30 января 2025",rating:5,
  pros:"Качество на высоте, цвет сочный.",cons:"",
  comment:"Заказывала семейный — всем хватило.",
  reply:"Оксана, благодарим за заказ! Уюта Вашему дому.",
  photos:["reviews/r12-1.png"],video:null},

 {art:4,name:"Елена",city:"Тюмень",date:"5 февраля 2025",rating:5,
  pros:"Сатин мягкий, после стирки как новый.",cons:"",
  comment:"Очень довольна покупкой.",
  reply:"Елена, спасибо! Носите с удовольствием.",
  photos:["reviews/r13-1.png"],video:null},

 {art:17,name:"Дарья",city:"Челябинск",date:"22 февраля 2025",rating:5,
  pros:"Бельё шикарное и плотное, пришло раньше срока.",cons:"",
  comment:"Буду заказывать ещё.",
  reply:"Дарья, спасибо! Ждём Вас снова.",
  photos:["reviews/r14-1.png"],video:null},

 {art:8,name:"Алёна",city:"Краснодар",date:"1 марта 2025",rating:5,
  pros:"Качество стабильно отличное.",cons:"",
  comment:"Это уже третий комплект от вас. Снимаю видео для тех, кто сомневается.",
  reply:"Алёна, огромное спасибо за лояльность и видео!",
  photos:["reviews/r15-1.png"],video:"reviews/r15.mp4"},

 {art:38,name:"Галина",city:"Ижевск",date:"13 января 2025",rating:4,
  pros:"Сатин приятный, постельное хорошее.",cons:"Хотелось бы больше расцветок.",
  comment:"А так всё нравится.",
  reply:"Галина, спасибо! Скоро пополним ассортимент новыми расцветками.",
  photos:["reviews/r16-1.png"],video:null},

 {art:28,name:"Кристина",city:"Ставрополь",date:"26 февраля 2025",rating:5,
  pros:"Мягкое, плотное, не просвечивает.",cons:"",
  comment:"За эти деньги — лучшее, что находила.",
  reply:"Кристина, спасибо за отзыв! Очень приятно.",
  photos:["reviews/r17-1.png"],video:null}
];

/* media[] и глобальный плоский список */
var MEDIA=[];
REVIEWS.forEach(function(r){
 var m=[];
 if(r.video)m.push({type:"video",src:r.video});
 r.photos.forEach(function(p){m.push({type:"img",src:p});});
 r.media=m;
 r.gStart=MEDIA.length;
 m.forEach(function(it){MEDIA.push({rev:r,type:it.type,src:it.src});});
});

/* ===================== ХЕЛПЕРЫ ===================== */
function el(tag,cls,html){var e=document.createElement(tag);if(cls)e.className=cls;if(html!=null)e.innerHTML=html;return e;}
function stars(n){var s="";for(var i=0;i<5;i++)s+=(i<n?"\u2605":"\u2606");return s;}
function esc(t){return (t||"").replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");}
function bg(u){return "background-image:url('"+u+"')";}
function avg(){var s=0;REVIEWS.forEach(function(r){s+=r.rating;});return s/REVIEWS.length;}
function plural(n){var a=n%10,b=n%100;if(a===1&&b!==11)return "отзыв";if(a>=2&&a<=4&&(b<10||b>=20))return "отзыва";return "отзывов";}
function posterOf(it,r){return it.type==="video"?(r.photos[0]||""):it.src;}

/* ===================== ЛАЙТБОКС ТОВАРА ===================== */
var plxOv,plxBig,plxStrip,plxImgs,plxIdx;
function buildPlx(){
 plxOv=el("div","plx-overlay");
 plxOv.innerHTML='<div class="plx"><span class="plx-close">\u00d7</span>'+
  '<div class="plx-body"><div class="plx-top">'+
   '<div class="plx-stage"><div class="plx-big" id="plxBig"></div><div class="plx-strip" id="plxStrip"></div></div>'+
   '<div class="plx-info">'+
    '<div class="plx-art">Артикул: <span id="plxArt"></span></div>'+
    '<h3 class="plx-h">Комплект постельного белья из сатина</h3>'+
    '<div class="plx-row"><b>Материал:</b> Сатин, 100% хлопок</div>'+
    '<div class="plx-row"><b>Плотность:</b> 125 г/м², не просвечивает</div>'+
    '<div class="plx-row"><b>В комплекте:</b> простынь, пододеяльник, наволочки</div>'+
   '</div></div></div>'+
  '<div class="plx-foot"><div class="plx-price"><span class="plx-old">4580 руб</span><span class="plx-new">2290 руб</span></div>'+
   '<a href="#order" class="plx-buy" id="plxBuy">Заказать</a></div></div>';
 document.body.appendChild(plxOv);
 plxBig=plxOv.querySelector("#plxBig");
 plxStrip=plxOv.querySelector("#plxStrip");
 plxBig.addEventListener("mousemove",function(e){var r=plxBig.getBoundingClientRect();var x=((e.clientX-r.left)/r.width)*100;var y=((e.clientY-r.top)/r.height)*100;plxBig.style.backgroundSize="230%";plxBig.style.backgroundPosition=x+"% "+y+"%";});
 plxBig.addEventListener("mouseleave",function(){plxBig.style.backgroundSize="cover";plxBig.style.backgroundPosition="center";});
 plxOv.querySelector(".plx-close").onclick=closePlx;
 plxOv.addEventListener("click",function(e){if(e.target===plxOv)closePlx();});
 plxOv.querySelector("#plxBuy").onclick=function(e){e.preventDefault();doOrder(plxOv.getAttribute("data-art"));};
}
function renderStrip(){
 plxStrip.innerHTML="";
 plxImgs.forEach(function(u,i){
  var d=el("div",i===plxIdx?"act":"");d.style.cssText=bg(u);
  d.onclick=function(){plxIdx=i;plxBig.style.cssText=bg(u);renderStrip();};
  plxStrip.appendChild(d);
 });
}
function openPlx(art,imgs,start){
 if(!plxOv)buildPlx();
 plxImgs=imgs;plxIdx=start||0;
 plxOv.setAttribute("data-art",art);
 plxOv.querySelector("#plxArt").textContent=art;
 plxBig.style.cssText=bg(plxImgs[plxIdx]);
 renderStrip();
 plxOv.classList.add("open");
}
function closePlx(){if(plxOv)plxOv.classList.remove("open");}
function doOrder(art){
 var c=document.getElementById("color");if(c&&art)c.value=art;
 closePlx();closeRvm();
 var t=document.querySelector('a.modal[href="#order"]');
 if(t){t.click();}else{location.hash="#order";}
}

/* ===================== ГАЛЕРЕЯ КАРТОЧКИ ТОВАРА ===================== */
function initGalleries(){
 var gals=document.querySelectorAll(".pgal");
 Array.prototype.forEach.call(gals,function(g){
  var imgs=(g.getAttribute("data-imgs")||"").split(",").filter(Boolean);
  var art=g.getAttribute("data-art")||"";
  if(!imgs.length)return;
  var active=0;
  function render(){
   var thumbs="";
   imgs.forEach(function(u,i){if(i!==active)thumbs+='<div class="pgal__thumb" data-i="'+i+'" style="'+bg(u)+'"></div>';});
   g.innerHTML='<div class="pgal__thumbs">'+thumbs+'</div><div class="pgal__main" style="'+bg(imgs[active])+'"></div>';
  }
  render();
  g.addEventListener("click",function(e){
   e.preventDefault();e.stopPropagation();
   var th=e.target.closest(".pgal__thumb");
   if(th){active=parseInt(th.getAttribute("data-i"),10);render();return;}
   if(e.target.closest(".pgal__main")){openPlx(art,imgs,active);}
  });
 });
}

/* ===================== МОДАЛКА ОТЗЫВА (сквозная навигация) ===================== */
var rvmOv,rvmStage,curG;
function buildRvm(){
 rvmOv=el("div","rvm-overlay");
 rvmOv.innerHTML='<div class="rvm-box"><span class="rvm-close">\u00d7</span>'+
  '<div class="rvm-left"><div class="rvm-back">\u2039 Ко всем фото и видео</div>'+
  '<button class="rvm-nav prev">\u2039</button><div class="rvm-stage" id="rvmStage"></div><button class="rvm-nav next">\u203a</button>'+
  '<div class="rvm-count" id="rvmCount"></div></div>'+
  '<div class="rvm-side" id="rvmSide"></div></div>';
 document.body.appendChild(rvmOv);
 rvmStage=rvmOv.querySelector("#rvmStage");
 rvmOv.querySelector(".rvm-close").onclick=closeRvm;
 rvmOv.querySelector(".rvm-back").onclick=closeRvm;
 rvmOv.addEventListener("click",function(e){if(e.target===rvmOv)closeRvm();});
 rvmOv.querySelector(".rvm-nav.prev").onclick=function(){navG(-1);};
 rvmOv.querySelector(".rvm-nav.next").onclick=function(){navG(1);};
 document.addEventListener("keydown",function(e){
  if(!rvmOv.classList.contains("open"))return;
  if(e.key==="ArrowRight")navG(1);else if(e.key==="ArrowLeft")navG(-1);else if(e.key==="Escape")closeRvm();
 });
}
function navG(d){curG=(curG+d+MEDIA.length)%MEDIA.length;renderG();}
function renderG(){
 var m=MEDIA[curG],r=m.rev;
 if(m.type==="video"){
  rvmStage.innerHTML='<video src="'+m.src+'" controls autoplay playsinline></video>';
 }else{
  rvmStage.innerHTML='<div class="img" style="'+bg(m.src)+'"></div>';
 }
 rvmOv.querySelector("#rvmCount").textContent=(curG+1)+" / "+MEDIA.length;
 var localActive=curG-r.gStart;
 var thumbs="";
 r.media.forEach(function(it,i){
  thumbs+='<div data-g="'+(r.gStart+i)+'" class="'+(i===localActive?"act ":"")+(it.type==="video"?"vid":"")+'" style="'+bg(posterOf(it,r))+'"></div>';
 });
 var txt=[r.pros,r.cons,r.comment].filter(Boolean).join(" ");
 var side='<div class="rvm-h"><div class="rvm-ava">'+esc(r.name.charAt(0))+'</div>'+
  '<div><div class="rvm-name">'+esc(r.name)+'</div><div class="rvm-sub">'+esc(r.city)+' \u00b7 '+esc(r.date)+'</div></div></div>'+
  '<div class="rvm-stars">'+stars(r.rating)+'</div>'+
  '<div class="rvm-objtitle">Артикул: '+esc(String(r.art))+'</div>'+
  '<p class="rvm-text">'+esc(txt)+'</p>'+
  (r.media.length>1?'<div class="rvm-thumbs-label">Ещё фото отзыва</div>':'')+
  '<div class="rvm-thumbs">'+thumbs+'</div>'+
  '<div class="rvm-reply"><b>Ответ продавца</b>'+esc(r.reply)+'</div>';
 var sd=rvmOv.querySelector("#rvmSide");
 sd.innerHTML=side;
 sd.scrollTop=0;
 Array.prototype.forEach.call(sd.querySelectorAll(".rvm-thumbs div"),function(d){
  d.onclick=function(){curG=parseInt(d.getAttribute("data-g"),10);renderG();};
 });
}
function openRvm(gIdx){
 if(!rvmOv)buildRvm();
 curG=gIdx||0;
 renderG();
 rvmOv.classList.add("open");
}
function closeRvm(){if(rvmOv){rvmOv.classList.remove("open");rvmStage.innerHTML="";}}

/* ===================== КАРУСЕЛЬ ОТЗЫВОВ ===================== */
var track,viewport,pagesBox,arrPrev,arrNext,curPage=0;
function perPage(){var w=window.innerWidth;if(w<=480)return 1;if(w<=680)return 2;if(w<=1000)return 3;return 4;}
function nPages(){return Math.ceil(REVIEWS.length/perPage());}
function buildCards(){
 track.innerHTML="";
 var pp=perPage();
 REVIEWS.forEach(function(r){
  var card=el("div","rv-card");
  card.style.flex="0 0 calc((100% - "+((pp-1)*16)+"px) / "+pp+")";
  var n=r.media.length;
  var cov='<div class="rv-cover rv-cov-'+Math.min(n,4)+'">';
  r.media.slice(0,4).forEach(function(it,ti){
   var more=(n>4&&ti===3)?'<span class="rv-more">+'+(n-3)+'</span>':'';
   var play=it.type==="video"?'<span class="rv-play">\u25b6</span>':'';
   cov+='<div class="rv-tile" data-g="'+(r.gStart+ti)+'" style="'+bg(posterOf(it,r))+'">'+play+more+'</div>';
  });
  cov+='</div>';
  card.innerHTML=cov+
   '<div class="rv-body"><div class="rv-top"><span class="rv-name">'+esc(r.name)+'</span><span class="rv-date">'+esc(r.date)+'</span></div>'+
   '<div class="rv-stars">'+stars(r.rating)+'</div>'+
   '<div class="rv-pros"><b>Достоинства:</b> '+esc(r.pros)+'</div></div>';
  card.addEventListener("click",function(e){
   var t=e.target.closest(".rv-tile");
   openRvm(t?parseInt(t.getAttribute("data-g"),10):r.gStart);
  });
  track.appendChild(card);
 });
}
function buildPages(){
 pagesBox.innerHTML="";
 var pp=perPage(),np=nPages();
 for(var p=0;p<np;p++){
  var s=p*pp+1,e=Math.min((p+1)*pp,REVIEWS.length);
  var b=el("div","rv-page"+(p===curPage?" act":""),s===e?(""+s):(s+"-"+e));
  (function(pi){b.onclick=function(){go(pi);};})(p);
  pagesBox.appendChild(b);
 }
}
function go(p){
 var np=nPages();
 if(p<0)p=0;if(p>np-1)p=np-1;
 curPage=p;
 var vw=viewport.clientWidth;
 var maxShift=Math.max(0,track.scrollWidth-vw);
 var shift=Math.min(p*(vw+16),maxShift);
 track.style.transform="translateX(-"+shift+"px)";
 arrPrev.disabled=(p===0);
 arrNext.disabled=(p>=np-1);
 Array.prototype.forEach.call(pagesBox.children,function(c,i){c.className="rv-page"+(i===curPage?" act":"");});
}
function renderReviews(){
 var root=document.getElementById("rvRoot");
 if(!root)return;
 var sr=document.querySelector(".satin-reviews");
 if(sr){var old=sr.querySelector(".box-title");if(old)old.style.display="none";}
 var a=avg();
 root.innerHTML=
  '<div class="rv-head"><div class="rv-h-title">Отзывы наших клиентов</div>'+
   '<div class="rv-rate"><span class="num">'+a.toFixed(1).replace(".",",")+'</span>'+
   '<span class="stwrap"><span class="st">'+stars(Math.round(a))+'</span>'+
   '<span class="cnt">'+REVIEWS.length+' '+plural(REVIEWS.length)+'</span></span></div></div>'+
  '<div class="rv-carousel"><button class="rv-arrow prev">\u2039</button>'+
   '<div class="rv-viewport"><div class="rv-track" id="rvTrack"></div></div>'+
   '<button class="rv-arrow next">\u203a</button></div>'+
  '<div class="rv-pages" id="rvPages"></div>';
 track=root.querySelector("#rvTrack");
 viewport=root.querySelector(".rv-viewport");
 pagesBox=root.querySelector("#rvPages");
 arrPrev=root.querySelector(".rv-arrow.prev");
 arrNext=root.querySelector(".rv-arrow.next");
 arrPrev.onclick=function(){go(curPage-1);};
 arrNext.onclick=function(){go(curPage+1);};
 buildCards();buildPages();go(0);
 var rt;
 window.addEventListener("resize",function(){
  clearTimeout(rt);
  rt=setTimeout(function(){buildCards();if(curPage>nPages()-1)curPage=nPages()-1;buildPages();go(curPage);},180);
 });
}

/* ===================== ПЕРЕНОС БЛОКА над “Сатин - лучший материал” ===================== */
function relocate(){
 var sr=document.querySelector(".satin-reviews");
 if(!sr)return;
 var heads=document.querySelectorAll(".box-title");
 var target=null;
 Array.prototype.forEach.call(heads,function(h){if(h.textContent.indexOf("лучший материал")>=0)target=h;});
 if(!target)return;
 var sec=target.closest("section")||target.parentNode;
 if(sec&&sec.parentNode)sec.parentNode.insertBefore(sr,sec);
}

/* ===================== СТАРТ ===================== */
function init(){initGalleries();relocate();renderReviews();}
if(document.readyState==="loading"){document.addEventListener("DOMContentLoaded",init);}else{init();}
})();
