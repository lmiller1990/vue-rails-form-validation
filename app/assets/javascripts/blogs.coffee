# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
console.log 'blogs'

template = """
"""

document.addEventListener 'DOMContentLoaded', () ->
  el = document.getElementById('blog-form-vue')
  blog = JSON.parse(el.dataset.blog)

  if el
    csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    new Vue({
      el: el,
      
      data: ->
        blog: blog
        csrfToken: csrfToken
        titleError: 'Title has to be at least 5 characters'
        bodyError: 'Body has to be at least 10 characters'

      computed:
        valid: ()->
          @blog.title.length > 5 && @blog.body.length > 10

      methods:
        buildRequest: ()->
          headers = new Headers()
          headers.append('X-Requested-With', 'XMLHttpRequest')
          headers.append('X-CSRF-TOKEN', @csrfToken)
          headers.append('Content-Type', 'application/json')
          new Request('/blogs', {
            headers: headers,
            credentials: 'same-origin',
            method: 'POST',
            body: JSON.stringify(
              "blog": {
                title: @blog.title,
                body: @blog.body
              }
            )
          })

        submit: ()->
          window.fetch @buildRequest()       
    })
