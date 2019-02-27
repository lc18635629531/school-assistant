/**加载购物车内容**/
$.ajax({
    url: 'data/cart/list.php',
    success: function (result) {
      if (result.code === 300) {
        alertMsg('您尚未登录！');
        $('#alertMsg_btn1').click(function () {
          location.href = 'login.html';
        });
      } else if (result.code === 200) {
        var html = '';
        if (result.data.length) {
          $.each(result.data, function (i, l) {
            html += `
          <div class="center_infor">
            <div class="center_infor_select">
              <div class="each">
                <span>
                  <img src="img/mall/product_detail/product_normal.png" alt="">
                </span>
                <input type="hidden">
              </div>
            </div>
            <div class="center_infor_detail">
              <div class="product_info_detail" id="">
                <a href="product_details.html?pid=${pid}">
                  <img src="img/mall/product_detail/sm/chongdianbao_sm1.jpg" alt="">
                </a>
                <input type="hidden">
                <span>
                  <a href="">罗马仕PIE10移动电源10000毫安轻薄聚合物充电宝通用型 轻薄质感、简约典雅、商务典范</a>
                  <input type="hidden">
                </span>
                <p>
                  <span class="norms">规格：</span>
                  <span class="norms_detail">
                    "10000mah聚合物移动电源","白色"
                    <input type="hidden">
                  </span>
                </p>
              </div>
            </div>
            <div class="center_infor_price">
              <p class="center_infor_price_title">积分值</p>
              <p class="center_infor_price_num">
                <span>
                  "5000"
                  <input type="hidden">
                </span>
              </p>
            </div>
            <div class="center_infor_count">
              <span class="center_infor_count_reduce">&nbsp;-&nbsp;</span>
              <input type="text" value="1">
              <span class="center_infor_count_add">&nbsp;+&nbsp;</span>
            </div>
            <div class="center_infor_integral">
              <span class="integral_count">5000</span>
            </div>
            <div class="center_infor_delete">
              <a href="" class="delect">删除</a>
            </div>
          </div>
            `;
          })
        } else {
          $('.none').show();
        }
        $('.center').html(html);
      }
    }
})
  
$(function () {
  
    if (!$(".center_infor")) {
      $('#section').hide();
      $('.none').show();
    }
  
    adddel();
    $('.center_infor').each(function () {
      var price = parseFloat($(this).children('.center_infor_price').children('.center_infor_price_num').children('span').html());
      var amount = parseFloat($(this).children('.center_infor_count').children('input').val());
      var amountPrice = price * amount;
      $(this).children('.center_infor_integral').children('.integral_count').html(amountPrice);
    });
    //全选
    $(".all").click(function () {
      amountadd();
      if ($('.all>span').hasClass('normal')) {
        $('.all>span').addClass('true').removeClass('normal');
        $('.all>span>img').attr('src', 'img/mall/product_details/product_true.png');
        $(".each>span").each(function () {
          $(this).addClass('true').removeClass('normal');
          $(this).children('img').attr('src', 'img/mall/product_details/product_true.png');
        })
  
        totl();
      } else {
        $('.all>span').addClass('normal').removeClass('true');
        $('.all>span>img').attr('src', 'img/mall/product_details/product_normal.png');
        $('.each>span').addClass('normal').removeClass('true');
        $('.each>span>img').attr('src', 'img/mall/product_details/product_normal.png');
        $(".susum").text(0.00);
        $(".susumOne").text(0.00);
        $('.total').text(0);
        $('.totalOne').text(0);
      }
    })
    //单选
    $('.center').on('click', '.each>span', function () {
      amountadd();
      $('.all>span').addClass('normal').removeClass('true');
      $('.all>span>img').attr('src', 'img/mall/product_details/product_normal.png');
      if ($(this).hasClass('normal')) {
        $(this).addClass('true').removeClass('normal');
        $(this).children('img').attr('src', 'img/mall/product_details/product_true.png');
        var amou = parseInt($('.total').text());
        amou++;
        $('.total').text(amou);
        $('.totalOne').text(amou);
        amountadd();
        var iid = $(this).parent().parent().siblings('.pudc').children('.pudc_information').attr('id');
        $.ajax({
          type: 'POST',
          url: 'data/cart/update_checked.php',
          data: {iid:iid, checked: 1},
          success: function(result){
            console.log(result);
          }
        })
      } else {
        $(this).addClass('normal').removeClass('true');
        $(this).children('img').attr('src', 'img/cart/product_normal.png');
        var amou = parseInt($('.total').text());
        amou--;
        $('.total').text(amou);
        $('.totalOne').text(amou);
        var newamo = parseInt($('.susum').text()) - parseInt($(this).parent().parent().siblings('.totle').children('.totle_information').text());
        $('.susum').text(newamo.toFixed(2));
        $('.susumOne').text(newamo.toFixed(2));
        var iid = $(this).parent().parent().siblings('.pudc').children('.pudc_information').attr('id');
        $.ajax({
          type: 'POST',
          url: 'data/cart/update_checked.php',
          data: {iid:iid, checked: 0},
          success: function(result){
            console.log(result);
          }
        })
      }
    })
  
  
    //删除当前行
    $('.center').on('click', '.delect', (function () {
      var me = this;
      var id = $(this).parent().siblings('.center_infor_detail').children('.product_info_detail').attr('id');
      $('.modal').fadeIn();
      $('.no').click(function () {
        $('.modal').fadeOut();
      });
      $('.yes').click(function () {
        $.ajax({
          type: "POST",
          url: "data/cart/del.php",
          data: {iid: id},
          success: function (result) {
            $('.modal').fadeOut();
            if(result.code==200){
              $(me).parent().parent().remove();
            }else {
              alertMsg('<b>删除失败！</b><p>错误原因为：'+result.msg+'</p>')
            }
          }
        });
      })
    }));
  
    //批量删除
    $(".body_bottom_del").click(function () {
      var str = [];
      $('.each>span').each(function () {
        if ($(this).hasClass('true')) {
          var id = $(this).parent().parent().next().children('.product_info_detail').attr('id');
          str.push(id);
  
        }
      });
      if (str.length > 0) {
        $('.modal').fadeIn();
        $('.no').click(function () {
          $('.modal').fadeOut();
        });
        $('.yes').click(function () {
          var url = '/delCartItems.html?&itemIds=' + str;
          window.location.href = url;
  
        });
      } else {
        $('.modalNo').fadeIn();
        $('.close').click(function () {
          $('.modalNo').fadeOut();
        })
      }
    })
})

  //合计
  function totl() {
    var sum = 0.00;
    var amount = 0;
    $(".integral_count").each(function () {
      sum += parseInt($(this).text());
      $(".susum").text(sum.toFixed(2));
      $(".susumOne").text(sum.toFixed(2));
      amount++;
      $('.total').text(amount);
      $('.totalOne').text(amount);
    })
  }
  // 单独
  function amountadd() {
    var amo = 0;
    $('.each>span').each(function () {
      if ($(this).hasClass('true')) {
        amo += parseInt($(this).parent().parent().siblings('.center_infor_integral').children('.integral_count').text());
      }
    })
    $('.susum').text(amo.toFixed(2));
    $('.susumOne').text(amo.toFixed(2));
  }
  
  function adddel() {
    //小计和加减
    //加
    $("#content_box_body").on('click', '.enter_infor_count_add', (function () {
      var $multi = 0;
      var vall = $(this).prev().val();
      vall++;
      $(this).prev().val(vall);
      $multi = (parseInt(vall).toFixed(2) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text()));
      $(this).parent().next().children().eq(1).text(Math.round($multi).toFixed(2));
      amountadd();
      var id = $(this).parent().siblings('.enter_infor_detail').children('.product_info_detail').attr('id');
      var num = $(this).prev().val();
      $.ajax({
        type: "POST",
        url: "data/cart/update_count.php",
        data: {iid: id, count: num},
        success: function (data) {
          console.log(data);
        }
      });
    }));
    //减
    $(".center").on('click', '.center_infor_count_reduce', (function () {
      var $multi1 = 0;
      var vall1 = $(this).next().val();
      vall1--;
      if (vall1 <= 0) {
        vall1 = 1;
      }
      $(this).next().val(vall1);
      $multi1 = parseInt(vall1) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text());
      $(this).parent().next().children().eq(1).text(Math.round($multi1).toFixed(2));
      amountadd();
      var id = $(this).parent().siblings('.enter_infor_detail').children('.product_info_detail').attr('id');
      var num = $(this).next().val();
      $.ajax({
        type: "POST",
        url: "data/cart/update_count.php",
        data: {iid: id, count: num},
        success: function (data) {
          console.log(data);
        }
      });
    }));
  }
  
  //去结算
  var str = [];
  var totalPrice = 0;
  $('#buy_all').click(function () {
    var totalPrice = parseFloat($('.susumOne').html());
    if(totalPrice<=0){
      alertMsg('请勾选您确定购买的商品！');
    }else {
      location.href = 'order_confirm.html';
    }
  })
  
  