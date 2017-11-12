$(document).ready(function(){


  $(".button-collapse").sideNav();
  $(".dropdown-button").dropdown({
    hover: false
  });

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 90, // Creates a dropdown of 15 years to control year,
    today: 'Hoy',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });


});
