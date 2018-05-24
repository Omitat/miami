// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.






$(document).on('turbolinks:load', function() {
  $('.save').on('click', function() {
    // console.log($('.modal-body').children());
    $('.modal-body form').submit()
  });






//navbar

var navBar = document.querySelector("#mobile-nav-container");
var sticky = navBar.offsetTop;


function stickyNav() {
// console.log('sticky = ' + sticky);
// console.log('scrollY = ' + window.scrollY);
if (window.scrollY >= sticky) {
    document.body.style.paddingTop = navBar.offsetHeight + 'px';
    document.body.classList.add('fixed-nav');
  } else {
    document.body.style.paddingTop = 0;
    document.body.classList.remove('fixed-nav');
  }

};

window.addEventListener('scroll', stickyNav);

});
