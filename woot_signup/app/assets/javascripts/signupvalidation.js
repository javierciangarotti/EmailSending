function validaRut(campo){
  if (campo.length == 0) {return false}
  if (campo.length < 8) {return false}
  console.log("El campo antes del replace: " +campo);
  campo = campo.replace('-', '')
  campo = campo.replace('.','')
  campo = campo.replace('.','')
  console.log(campo);

  var suma = 0;
  var caracteres = "1234567890kK";
  var contador = 0;

  for (var i = 0; i < campo.length; i++ ){
    u = campo.substring(i, i + 1);
    if(caracteres.indexOf(u) != -1)
      contador ++;

  }
  if(contador == 0) {return false;}

  var rut = campo.substring(0, campo.length-1) // Número antes del dígito
  var drut = campo.substring(campo.length -1) // Dígito verificador
  var dvr = '0';
  var mul = 2;

  for(i = rut.length -1; i >= 0; i-- ){
    suma = suma + rut.charAt(i) * mul;
    if(mul == 7) mul = 2
    else mul ++
  }

  res = suma % 11;
  if(res == 1) dvr = 'k'
  else if (res == 0) dvr = '0'
    else {
      dvi = 11 - res
      dvr = dvi + ""
    }

  if( dvr != drut.toLowerCase() ) { return false; }
  else { return true; }

}



$(document).ready(function () {

  $.validator.addMethod("regex", function(value, element, regexpr) {
    return regexpr.test(value);
  }, "Please enter a valid pasword.");

  // comentar si jquery.Validate no se está usando
  $.validator.addMethod("rut", function(value, element) {
          return this.optional(element) || validaRut(value);
  }, "Revise el RUT");

   $.validator.setDefaults({
       errorClass: 'invalid',
       validClass: "valid",
       errorPlacement: function (error, element) {
           $(element)
               .closest("form")
               .find("label[id='" + element.attr("id") + "']")
               .attr('data-error', error.text());
       }
   });

   $("#form").validate({
       rules: {
         "user[first_name]": {
             required: true,
             minlength: 5
         },
         "user[document]": {
             required: true,
             regex: /^0*(\d{1,3}(\.?\d{3})*)\-?([\dkK])$/,
             rut: true
         }
       },
        messages: {
          "user[first_name]": "Enter your firstname",
          "user[document]":
            {
              required: "Ingresa un documento válido",
              regex: "Ingresa un número de documento válido",
              rut: "Revise que esté bien escrito"
            }
        }

   });

   // using jQuery Mask Plugin v1.7.5
   // http://jsfiddle.net/d29m6enx/2/
   var maskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '99.###.###-#' : '99.###.###-0';
   },
   options = {onKeyPress: function(val, e, field, options) {
    field.mask(maskBehavior.apply({}, arguments), options);
    }
   };

   $('#user_document').mask(maskBehavior, options);

});
