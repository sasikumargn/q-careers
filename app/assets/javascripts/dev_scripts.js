$.fn.datepicker.defaults.format = "dd/mm/yyyy";
function addDatePicker(identifier){
  $(identifier).datepicker({
    clearBtn: true,
    autoclose: true,
    format: "dd/mm/yyyy"
  });
}

//===========================================================
//  Carousel
//===========================================================
//  Scrolled by user interaction
$('#carousel').carouFredSel({
    auto: true,
    scroll : {
        items       : 1, 
        duration    : 1000,
    },
    items: {
        visible: {
            min: 1,
            max: 4
        }
    },
    width: '100%',
    prev : {
        button      : "#carousel-nav-prev",
        key         : "left",
        items       : 1,
        duration    : 500
    },
    next : {
        button      : "#carousel-nav-next",
        key         : "right",
        items       : 1,
        duration    : 500
    },
    mousewheel: false,
    swipe: {
        onMouse: true,
        onTouch: true
    }
});