$(document).ready(function(){
  $("#cart_item_quantity").change(function(){
    $('#quantity_change_form').submit();
  });
});