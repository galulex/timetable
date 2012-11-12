jQuery ->
  $('#search_group_id').hide()
  groups = $('#search_group_id').html()
  $('#search_institution_id').change ->
    institution = $('#search_institution_id :selected').text()
    escaped_institution = institution.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(groups).filter("optgroup[label='#{escaped_institution}']").html()
    if options
      $('#search_group_id').html(options)
      $('#search_group_id').show()
    else
      $('#search_group_id').empty()
      $('#search_group_id').hide()

