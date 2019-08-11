//= require jquery
//= require rails-ujs
//= require_tree .

document.addEventListener("DOMContentLoaded", () => {
  console.log('The page is loaded!')

$( "#search-form" ).hide()

if (document.getElementById("site_form")) {
  document.getElementById("site_form").addEventListener("change", updateFunction);

  function updateFunction() {
    form = document.getElementById('site_form');
    Rails.fire(form, 'submit');
  }
}

if (document.getElementById("search")) {
document.getElementById("search").addEventListener("keyup", searchFunction);

function searchFunction() {
  console.log("hit function")
  form = document.getElementById('search');
  $( "#search-form" ).trigger( "click" );
}
}


});
