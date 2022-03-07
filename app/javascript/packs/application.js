// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

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