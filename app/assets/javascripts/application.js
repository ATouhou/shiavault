// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation/foundation
// require foundation/foundation.abide
// require foundation/foundation.accordion
// require foundation/foundation.alert
// require foundation/foundation.clearing
// require foundation/foundation.dropdown
// require foundation/foundation.interchange
// require foundation/foundation.joyride
// require foundation/foundation.magellan
// require foundation/foundation.offcanvas
// require foundation/foundation.orbit
// require foundation/foundation.reveal
// require foundation/foundation.slider
// require foundation/foundation.tab
// require foundation/foundation.tooltip
// require foundation/foundation.topbar
// require foundation/foundation.equalizer
// require turbolinks
//= require_tree .

$(function () {
  $(document).foundation();

  new Search('#search');
});
