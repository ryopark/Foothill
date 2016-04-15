# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @ChatClass
  constructor: (url, useWebsocket) ->
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @events()

  events: () =>
    $('#send').on 'click', @submitMessage
    @dispatcher.bind 'after_new_message', @receiveMessage

  submitMessage: (event) =>
    @dispatcher.trigger 'new_message', $('#comment').val()

  receiveMessage: (message) =>
    $('#chat_area').append("<li>#{message}</li>")

$ ->
  window.chatClass = new ChatClass('localhost:3000/websocket', true)
