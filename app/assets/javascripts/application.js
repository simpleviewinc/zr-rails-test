//= require jquery
//= require rails-ujs
//= require_tree .

document.addEventListener("DOMContentLoaded", () => {
  console.log('The page is loaded!')


if (document.getElementById("site_form")) {
  document.getElementById("site_form").addEventListener("change", updateFunction);

  function updateFunction() {
    form = document.getElementById('site_form');
    Rails.fire(form, 'submit');
  }
}


document.getElementById("search").addEventListener("change", searchFunction);

function searchFunction() {
  console.log("hit function")
  form = document.getElementById('search');
  Rails.fire(form, 'submit');
}



});
