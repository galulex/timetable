// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require foundation
//= require lazybox
//= require_tree .

$.setReadyEvent('page:change');

$(document).foundation();
$(document).ready(function() {
  $('a[rel*=lazybox]').lazybox();

  $("#institution").bind('keyup',function() {
    $.ajax({
      url: 'http://graph.facebook.com/search',
      dataType: 'jsonp',
      data: {
        q: $("#institution").val(),
        type: 'adcollege'
      },
      success: function(data) {
        var autocomplete_data = [];
        for (var i = 0; i < data['data'].length; i++) {
          autocomplete_data.push(data['data'][i]['name']);
        }
        $("#institution").autocomplete({source:autocomplete_data});
      }
    });
  });
});
