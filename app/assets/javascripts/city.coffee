$(document).on 'ready page:load', ->
  $('.select-city').select2
    placeholder: 'Selecione'
    ajax:
      url: Routes.cities_path(format: 'json')
      dataType: 'json'
      delay: 250
      data: (params) ->
        {
          q: params.term
          page: params.page
        }
      processResults: (data, params) ->
        params.page = params.page or 1
        {
          results: data
          pagination: more: params.page * 30 < data.total_count
        }
      cache: true
  return
