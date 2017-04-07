// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap

//= require turbolinks
//= require_tree .
//= require moment
//= require bootstrap-datetimepicker

$(document).on("turbolinks:load", function(){ 

  $(".check_all").click(function(){
    var form = $(this).parents('form')
    var check = form.find('input');
    var button = form.find('.delete_selected');
    var cboxes = form.find('input:checkbox:checked');

    for (var i = 0; i < check.length; i++) {
      if (check[i].type == 'checkbox') { 
        button.removeAttr("disabled");   
        check[i].checked = true; 
      }
    } 
  }); 
   
  $(".uncheck_all").click(function(){
    var form = $(this).parents('form')
    var check = form.find('input');
    var button = form.find('.delete_selected');
    var cboxes = form.find('input:checkbox:checked');

    for (var i = 0; i < check.length; i++) {
      if (check[i].type == 'checkbox') { 
        button.attr( "disabled", "disabled");  
        check[i].checked = false; 
      }
    } 
  });
  $('form').on("change", function(){
    var form = $(this);
    var button = form.find('.delete_selected');
    var cboxes = form.find('input:checkbox:checked');
    if (cboxes.length > 0) {
      button.removeAttr("disabled");
    } else {
      button.attr( "disabled", "disabled");
    }  
  });

 
}); 
