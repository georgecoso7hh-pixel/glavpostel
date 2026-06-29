// ****************************************************************************
// * SCRIPT.JS SPECIAL FOR NEJNII SATIN © 2017
// * AUTHOR: IVAND || LANGUAGE: RU, EN, FR || SKYPE: RU.LAIN
// * URL: SOCIALMEDIA64.RU
// ****************************************************************************


// Button to TOP

$(function () {

  var number = 550;
  var delay = 1000;
  $(document).ready(function () {
    $(window).scroll(function () {

      if ($(this).scrollTop() > number) $('#gotop').fadeIn();
      else $('#gotop').fadeOut();

    });
    $('#gotop').click(function () {

      $('body, html').animate({
        scrollTop: 0
      }, delay);

    });
  });

  $('.prod-buttons #sat_order').click(function () {

    // Переменные, которые необходимо вывести из кнопки
    var order_name, order_hlopok, order_mat, old_price, new_price, order_navoloch, order_pod, order_prost;

    // Кнопка, которая была нажата
    var button = $(this);

    // Узнаем родительский элемент
    var elem = button.parent().parent();

    // Получаем данные из блоков и сохраняем их в переменные
    order_name = elem.parent().parent().find('#name').text();
    order_hlopok = elem.parent().parent().find('#hlopok').text();
    order_mat = elem.parent().parent().find('#mat').text();
    old_price = elem.parent().parent().find('.old-price').text();
    new_price = elem.parent().parent().find('.new-price').text();
    order_navoloch = elem.parent().parent().find('.pillowcases').text();
    order_podo = elem.parent().parent().find('.duvet-cover').text();
    order_prostin = elem.parent().parent().find('.bedsheet').text();
    order_pod = elem.parent().parent().find('.prod-sale').text();
    order_prost = elem.parent().parent().find('.prod-sale').text();
    order_image = elem.parent().parent().find('.wp-post-image').attr('src');
    order_button_s = elem.parent().parent().find('.prod_s_but').html();

    // Блок подробнее
    var order_box = $('#ordering');

    // Ищем элементы и добавляем нужный текст
    order_box.find('#order_name').text(order_name);
    order_box.find('#order_hlopok').text(order_hlopok);
    order_box.find('#order_mat').text(order_mat);
    order_box.find('#old-price').text(old_price);
    order_box.find('#new-price').text(new_price);
    order_box.find('#order_navoloch').text(order_navoloch);
    order_box.find('#order_pod').text(order_podo);
    order_box.find('.prod-buttons-s').html(order_button_s);
    order_box.find('#order_prost').text(order_prostin);
    order_create_bg = 'background-image:url(' + order_image + ');';
     

  });

  $(document).on('click','#sat_order_full', function(){

  	// Переменные, которые необходимо вывести из кнопки
    var order_name, order_hlopok, order_mat, old_price, new_price, order_navoloch, order_pod, order_prost;

    // Кнопка, которая была нажата
    var button = $(this);

    // Узнаем родительский элемент
    var elem = button;

    // Получаем данные из блоков и сохраняем их в переменные
    order_name = elem.parent().find('#name').text();
    order_hlopok = elem.parent().find('#hlopok').text();
    order_mat = elem.parent().parent().find('#mat').text();
    old_price = elem.parent().parent().find('.old-price').text();
    new_price = elem.parent().parent().find('.new-price').text();
    order_navoloch = elem.parent().parent().find('.pillowcases').text();
    order_podo = elem.parent().parent().find('.duvet-cover').text();
    order_prostin = elem.parent().parent().find('.bedsheet').text();
    order_pod = elem.parent().parent().find('.prod-sale').text();
    order_prost = elem.parent().parent().find('.prod-sale').text();
    order_image = elem.parent().parent().find('.wp-post-image').attr('src');
    order_button_s = elem.parent().parent().find('.prod_s_but').html();
    console.log('Имя:' + order_name);
    // Блок подробнее
    var order_box = $('#ordering');

    // Ищем элементы и добавляем нужный текст
    order_box.find('#order_name').text(order_name);
    order_box.find('#order_hlopok').text(order_hlopok);
    order_box.find('#order_mat').text(order_mat);
    order_box.find('#old-price').text(old_price);
    order_box.find('#new-price').text(new_price);
    order_box.find('#order_navoloch').text(order_navoloch);
    order_box.find('#order_pod').text(order_podo);
    order_box.find('.prod-buttons-s').html(order_button_s);
    order_box.find('#order_prost').text(order_prostin);
    order_create_bg = 'background-image:url(' + order_image + ');';
   
	$(document).find('#color').attr('value', order_name);
  });

  // Клик на кнопку заказать
  $(document).on('click','.prod-buttons-s #sat_ordering', function(){

    // Переменные, которые необходимо вывести из кнопки
    var order_art, order_o_price, order_o_image;

    // Кнопка, которая была нажата
    var button = $(this);

    // Узнаем родительский элемент
    var elem = button.parent().parent();

    // Получаем данные из блоков и сохраняем их в переменные
    order_art = elem.parent().parent().parent().find('#order_name').text();
    order_o_price = elem.find('#new-price').text();
    order_o_name = elem.parent().parent().find('.name').text();
    

    // Блок заказа
    var ordering_box = $('#order');

    // Ищем элементы и добавляем нужный текст
    ordering_box.find('#name').text(order_art);
    ordering_box.find('#price').text(order_o_price);
    ordering_box.find('.img').attr('style', order_o_image);

  });

  // Клик на кнопку заказать
  $('.prod-buttons #sat_ordering').click(function () {

    // Переменные, которые необходимо вывести из кнопки
    var order_art, order_o_price, order_o_image;

    // Кнопка, которая была нажата
    var button = $(this);

    // Узнаем родительский элемент
    var elem = button.parent().parent().parent();

    // Получаем данные из блоков и сохраняем их в переменные
    order_art = elem.parent().find('#art').text();
    order_o_price = elem.parent().find('.new-price').text();
    order_o_image = elem.parent().find('.wp-post-image').attr('src');

    // Блок заказа
    var ordering_box = $('#order');

    // Ищем элементы и добавляем нужный текст
    ordering_box.find('#name').text(order_art);
    ordering_box.find('#price').text(order_o_price);
    order_create_img = 'background-image:url(' + order_o_image + ');';
    ordering_box.find('.img').attr('style', order_create_img);

  });

});

// END Button to TOP

$("#Container").mixItUp({
  load: {
    filter: '.1-5-spalnye',
    sort: 'myorder:desc'
  }
});

var nav = $('.products-filter a:first-child').attr('data-cat');
$('.nav-text').html(nav);

$('.products-filter a').click(function () {
  var nav_title = this.getAttribute('data-cat');
  $('.nav-text').html(nav_title);

});

$(document).on("click", ".filter-1 a", function (event) {

  number_click = $(this).parent().index();

  var li = $('.filter-2 a');
  var vals = li.map(function () {
    return $(this);
  }).get();

  vals[number_click].addClass('active');

});

$(document).on("click", ".filter-2 a", function (event) {

  number_click = $(this).parent().index();

  var li = $('.filter-1 a');
  var vals = li.map(function () {
    return $(this);
  }).get();

  vals[number_click].addClass('active');

});

$(".cert-items a").fancybox({
  autoResize: false,
  closeClick: true,
  closeEffect: "fade",
  helpers: {
    title: {
      type: "inside"
    }
  },
  maxWidth: "80%",
  nextEffect: "none",
  openEffect: "fade",
  padding: 0,
  cyclic: true,
  prevEffect: "none"
});

$(".modal").fancybox({
  autoResize: false,
  closeEffect: "fade",
  maxWidth: "90%",
  nextEffect: "none",
  openEffect: "fade",
  padding: 0,
  closeClick: false,
  cyclic: true,
  prevEffect: "none"
});

$(".cb").fancybox({
  autoResize: false,
  closeEffect: "fade",
  helpers: {
    title: {
      type: "inside"
    }
  },
  maxWidth: "90%",
  nextEffect: "none",
  openEffect: "fade",
  padding: 0,
  cyclic: true,
  prevEffect: "none"
});

// ORDERS JS


var StickyElement = function (node) {
  var doc = $(document),
    fixed = false,
    anchor = node.find('.header-box-fixed-fix'),
    content = node.find('.header-box-glob');

  var onScroll = function (e) {
    var docTop = doc.scrollTop(),
      anchorTop = anchor.offset().top;

    if (docTop > anchorTop) {
      if (!fixed) {
        anchor.height(content.outerHeight());
        content.addClass('fixed');
        fixed = true;
      }
    } else {
      if (fixed) {
        anchor.height(0);
        content.removeClass('fixed');
        fixed = false;
      }
    }
  };

  $(window).on('scroll', onScroll);
};

var demo = new StickyElement($('.header-box-fixed'));

$('.mobile-items .cert-items.__noslick__').slick({
  centerMode: true,
  centerPadding: '60px',
  slidesToShow: 1
});

$(document.body).on("click", ".buyClick-ch", function (ch) {


  if (!$('#ch_name').val()) {

    $('#ch_name').addClass('error');
    setTimeout(function () {
      $("#ch_name").removeClass('error')
    }, 5000);
    return false;

  } else if (!$('#ch_phone').val()) {

    $('#ch_phone').addClass('error');
    setTimeout(function () {
      $("#ch_phone").removeClass('error')
    }, 5000);
    return false;

  } else {

    var title_send = $(this).parent().parent().parent().find('#name').text();
    var name_send = $(this).parent().parent().parent().find('#ch_name').val();
    var phone_send = $(this).parent().parent().parent().find('#ch_phone').val();
    var price_send = $(this).parent().parent().parent().find('#price').text();


    $.fancybox({
      href: "#order_suc",
      autoResize: true,
      closeEffect: "fade",
      helpers: {
        title: {
          type: "inside"
        }
      },
      maxWidth: "100%",
      nextEffect: "none",
      openEffect: "fade",
      padding: 0,
      cyclic: true,
      prevEffect: "none"
    });

    $('#ch_name').val('');
    $('#ch_phone').val('');

    $('.close_order').trigger('click');

  }

});

$(document.body).on("click", ".callback button", function (ch) {


  if (!$('#ch_f_name').val()) {

    $('#ch_f_name').addClass('error');
    setTimeout(function () {
      $("#ch_f_name").removeClass('error')
    }, 5000);
    return false;

  } else if (!$('#ch_f_tel').val()) {

    $('#ch_f_tel').addClass('error');
    setTimeout(function () {
      $("#ch_f_tel").removeClass('error')
    }, 5000);
    return false;

  } else {


    

    $.fancybox({
      href: "#suc_callback",
      closeEffect: "fade",
      helpers: {
        title: {
          type: "inside"
        }
      },
      maxWidth: "100%",
      nextEffect: "none",
      openEffect: "fade",
      padding: 0,
      cyclic: true,
      prevEffect: "none"
    });

    $('#ch_f_name').val('');
    $('#ch_f_tel').val('');

  }

});


$('.tel').inputmask({"mask": "+7 (999) 999-9999"});

$(".demo-video").fancybox({
  maxWidth: 800,
  maxHeight: 600,
  fitToView: false,
  width: '70%',
  height: '70%',
  autoSize: false,
  closeClick: false,
  openEffect: 'none',
  closeEffect: 'none'
});

$("#gpolitik").animatedModal({
  animatedIn: "slideInUp",
  animatedOut: "bounceOutDown",
  color: "#fff",
  modalTarget: "politik"
});
$("#goferta").animatedModal({
  animatedIn: "slideInUp",
  animatedOut: "bounceOutDown",
  color: "#fff",
  modalTarget: "oferta"
});

// Кликаем на фиксированную кнопку
$(document).on('click','.fixed-button .title', function(){
  // Получаем родителя кнопки и ищем класс .content
  box_toggle = $(this).parent().find('.content');
  // При клике у родителя переключаем класс active
  $(this).parent().toggleClass('active');
});


$(document).mouseup(function(e){

    if(!$('.tabs ul li.active').is(e.target)
    &&  $('.tabs ul li.active').has(e.target).length === 0 
    && !$('.tabs-content.drop').is(e.target)
        && $('.tabs-content.drop').has(e.target).length === 0){

      $('.tabs-content').removeClass('drop');
      $('.tabs ul li.active').removeClass('active');

    }

  });

$(document).click(function(e){
  if(!$('.fixed-button .title').is(e.target)
    &&  $('.fixed-button .title').has(e.target).length === 0 
){

      $('.checking-toggle').removeClass('active');

    }
});

$(document).on('click','.close_fixed_button',function(close_button){

  close_button.preventDefault();

  $('.checking-toggle').removeClass('active');

});

function showDrops(el)
  {
    $('.tabs-content').toggleClass('drop');
  }

  $('.tabs ul li').click(function(e)
  {
    showDrops(this);
        e.preventDefault();
  });

(function($){       
    jQuery.fn.lightTabs = function(options){
        
        var createTabs = function(){
            tabs = this;
            i = 0;
            
            showPage = function(i){
                $(tabs).children("div").children("div").hide();
                $(tabs).children("div").children("div").eq(i).show();
                $(tabs).children("ul").children("li").eq(i).toggleClass("active");
            }
            
            showPage(0);        
            
            $(tabs).children("ul").children("li").each(function(index, element){
                $(element).attr("data-page", i);
                i++;                        
            });
            
            $(tabs).children("ul").children("li").click(function(){
                showPage(parseInt($(this).attr("data-page")));
            });      
        };    
        return this.each(createTabs);
    };  
})(jQuery);

$(".tabs").lightTabs();

! function(i) {
      var o, n;
      i(".title_block").on("click", function() {
        o = i(this).parents(".accordion_item"), n = o.find(".info"),
          o.hasClass("active_block") ? (o.removeClass("active_block"),
            n.slideUp()) : (o.addClass("active_block"), n.stop(!0, !0).slideDown(),
            o.siblings(".active_block").removeClass("active_block").children(
              ".info").stop(!0, !0).slideUp())
      })
    }(jQuery);

function windowSize(){

  if ($(window).width() <= '1080'){

    $('#tab-ac-1').html($('#tab-1').html());
    $('#tab-ac-2').html($('#tab-2').html());
    $('#tab-ac-3').html($('#tab-3').html());

  }

}

new anim().init();

$(window).on('load resize',windowSize);
