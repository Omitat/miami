// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  $('.save').on('click', function() {
    console.log($('.modal-body').children());
    $('.modal-body').children()[0].submit()
  });

});
