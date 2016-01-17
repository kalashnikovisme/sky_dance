#= require jquery
#= require jquery_ujs
#= require fancybox
#= require twitter/bootstrap
#= require ckeditor/init
#= require welcome
#= require_tree.

$ ->
  $('.link').click ->
    location.href = $(this).data('href')
