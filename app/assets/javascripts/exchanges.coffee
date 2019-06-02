$(document).ready ->
 
  conversion = ->
    $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
      

  $('#amount').keyup ->
  	if $('form').attr('action') == '/convert'
      conversion()

  $('form').submit ->
    if $('form').attr('action') == '/convert'
      conversion()

  $('.invert').click ->
  	source_currency = $('#source_currency').val()
  	target_currency = $('#target_currency').val()

  	$('#source_currency').val(target_currency)
  	$('#target_currency').val(source_currency)
  	conversion()
