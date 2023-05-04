// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import $ from 'jquery';

document.addEventListener('turbo:load', () => {
  setTimeout(function(){
    $(".alert").fadeOut();
  }, 5000);
});
