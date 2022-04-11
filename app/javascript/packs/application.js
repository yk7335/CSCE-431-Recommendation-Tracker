// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs 
//= require best_in_place

//= require jquery-ui
//= require best_in_place.jquery-ui
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import './gems.js.erb'

import "bootstrap"
import "../stylesheets/application"



Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(".best_in_place").best_in_place();

$(function() {
    $('.view_details').click(function() {
      if ($(this).is(':checked')) {
        $(this)
          .next('label')
          .html('&times;')
          .attr('title', 'tap here to close full profile');
        $(this)
          .parent()
          .next('main')
          .slideDown('normal');
      } else {
        $(this)
          .next('label')
          .html('☰')
          .attr('title', 'tap here to view full profile');
        $(this)
          .parent()
          .next('main')
          .slideUp('fast');
      }
    });
  });

  $(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
  });