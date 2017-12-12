  $(document).ready(function() {
      theme.init();
      
//    Carrusel2
    $('.carousel').carousel({
      interval: 6000
    });
  });
  
  var theme = {
    init: function () {
        this.setupFunctionality();
    }, 
    setupFunctionality: function () {
        jQuery('#txtSearch').keyup(function (key) {
            var query = jQuery.trim(jQuery(this).val());
            if (key.which === 13) {
                theme.busqueda(query);
            }
        });
    },
    busqueda: function (_buscar) {
       
    }
  };

(function(){

  $('#itemslider').carousel({ interval: 3000 });
}());

(function(){
  $('.carousel-showmanymoveone .item').each(function(){
    var itemToClone = $(this);

    for (var i=1;i<6;i++) {
      itemToClone = itemToClone.next();


      if (!itemToClone.length) {
        itemToClone = $(this).siblings(':first');
      }


      itemToClone.children(':first-child').clone()
        .addClass("cloneditem-"+(i))
        .appendTo($(this));
    }
  });
}());

