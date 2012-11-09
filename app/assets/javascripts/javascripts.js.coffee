jQuery ->
  $('#group_id').hide()
  groups = $('#group_id').html()
  $('#schedule_institution_id').change ->
    institution = $('#schedule_institution_id :selected').text()
    escaped_institution = institution.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(groups).filter("optgroup[label='#{escaped_institution}']").html()
    if options
      $('#group_id').html(options)
      $('#group_id').show()
    else
      $('#group_id').empty()
      $('#group_id').hide()

