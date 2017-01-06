# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'turbolinks:load', () ->
    $('.single-item').slick({
      slidesToShow:1,
      slidesToScroll:1,
      autoplay:true,
      pauseOnHover: true
      autoplaySpeed:3000,
      responsive:[{
        breakpoint: 960,
        settings:{
          arrows: false,
          slidesToShow: 3
          }
      }
      {
        breakpoint: 640,
        settings:{
          slidesToShow: 1
        }
      }]
    })
    $(".slick-prev").text("<")
    $(".slick-next").text(">")