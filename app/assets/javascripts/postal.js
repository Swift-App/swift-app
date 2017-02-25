$(window).ready( function() {
  $('#user_postal_code').jpostal({
    postcode : [
      '#user_postal_code'
    ],
    address : {
      "#user_prefecture" : "%3",
      "#user_city"            : "%4%5",
      "#user_address_details" : "%6%7"
    }
  });
});