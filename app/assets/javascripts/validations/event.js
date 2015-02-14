function validateEventForm() {

    $('#form_event').validate({
      debug: true,
      rules: {
        "event[name]": {
            required: true,
            minlength: 3,
            maxlength: 255
        },
        "event[date]": "required",
        "event[venue]": "required"
      },
      errorElement: "span",
      errorClass: "help-block",
      messages: {
        "event[name]": "can't be blank",
        "event[date]": "can't be blank",
        "event[venue]": "can't be blank"
      },
      highlight: function(element) {
          $(element).parent().parent().addClass("has-error");
      },
      unhighlight: function(element) {
          $(element).parent().parent().removeClass("has-error");
      },
      invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {

          // Populating error message
          var errorMessage = errors == 1
            ? 'You missed 1 field. It has been highlighted'
            : 'You missed ' + errors + ' fields. They have been highlighted';

          // Removing the form error if it already exists
          var errorHtml = "<div class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          $("#event_form_error").html(errorHtml);

          // Show error labels
          $("div.error").show();

        } else {
          // Hide error labels
          $("div.error").hide();

          // Removing the error message
          $("#event_form_error").remove();
        }
      }

    });

}
