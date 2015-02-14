$.fn.datepicker.defaults.format = "dd/mm/yyyy";
function addDatePicker(identifier){
  $(identifier).datepicker({
    clearBtn: true,
    autoclose: true,
    format: "dd/mm/yyyy"
  });
}