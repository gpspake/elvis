# Description:
#   Image Macro Responder
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   anything!
#
# Author:
#   dpritchett
#   svpernova09
#   basedgeek
#   bkmontgomery

module.exports = (robot) ->
  
  ###############################
  # Auto-response machinery
  ###############################
  
  registerResponder = (args) ->
    respond = (msg) ->
      if args.note?
        msg.send [args.note, msg.random(args.responses)].join(' ')
      else
        msg.send msg.random(args.responses)

    for trigger in args.triggers
      robot.hear trigger, respond
      
  ################################
  # Configuration of responses
  ################################

  # this is the simplest example of a responder.  It hears the phrase 'sick burn' (case insensitive)
  # and it responds with one of the images from its list.  Its list is only one image long.
  #
  # 3:04 PM <dpritchett> burn centers
  # 3:05 PM <Elvis> http://en.wikipedia.org/wiki/List_of_burn_centers_in_the_United_States
  registerResponder
    triggers:  [/burn centers/i]
    responses: [
      "http://en.wikipedia.org/wiki/List_of_burn_centers_in_the_United_States",
    ]

  # this responder adds the concept of a descriptive note - flavor text for the response.
  registerResponder
    note:     'Sick burn!'
    triggers:  [/sick burn/i, /oh burn/i]
    responses: ["http://zerowoes.com/wp-content/uploads/2014/01/hqdefault.jpg"]
    
  # how to Elvis
  registerResponder
    note:     'How to write an elvis macro auto response:'
    triggers:  [/^elvis macros/i, /^elvis image macros/i]
    responses: ['https://github.com/memtech/memtech-hubot/blob/master/scripts/image_macro_responder.coffee']

  registerResponder
    triggers:  [/lolwut/i, /lol wut/i]
    responses: [  # lazily tripled the likelihood of the first image coming back O_o
          "https://www.evernote.com/shard/s9/sh/f27bc4e3-f3e0-43ec-9db7-5bd16bdc0ffc/8f7d6ab7160aa6704fbd22ed43f9a315/deep/0/elvis-lol-wut.png",
          "https://www.evernote.com/shard/s9/sh/f27bc4e3-f3e0-43ec-9db7-5bd16bdc0ffc/8f7d6ab7160aa6704fbd22ed43f9a315/deep/0/elvis-lol-wut.png",
          "https://www.evernote.com/shard/s9/sh/f27bc4e3-f3e0-43ec-9db7-5bd16bdc0ffc/8f7d6ab7160aa6704fbd22ed43f9a315/deep/0/elvis-lol-wut.png",
          "http://lolwut.com/layout/lolwut.jpg"
    ]


  # 3:01 PM <•dpritchett> RF
  # 3:01 PM <Elvis> RocketFuel! http://i.imgur.com/S2qngvc.jpg
  registerResponder
    note:     'RocketFuel!'
    triggers:  [
      /(rocket fuel|rocketfuel)/i,
      /(RF | RF |RF [^A-Za-z])/]
    responses: [
      "https://pbs.twimg.com/media/Bt49KjPCUAABmjS.jpg",
      "https://pbs.twimg.com/media/Btp4KJAIAAA-QzT.jpg",
      "https://pbs.twimg.com/media/BtpMnQCCQAAJllq.jpg",
      "https://pbs.twimg.com/media/BsSO4ODCYAALup7.jpg",
      "https://pbs.twimg.com/media/BVa-YGHCcAAJOfg.jpg",
      "https://pbs.twimg.com/media/Bt9sYOKIYAAveEd.jpg",
      "https://pbs.twimg.com/media/BL2A1NECAAAGXvU.jpg",
      "http://www.gorocketfuel.com/sites/282/uploaded/images/10565013_10152643242707363_7272254102583821991_n_1.jpg",
      "https://pbs.twimg.com/media/BxCdNhgCYAAQIa6.png",
      "https://pbs.twimg.com/media/Bt9sYOKIYAAveEd.jpg",
      "http://i.imgur.com/S2qngvc.jpg",
      "http://i.imgur.com/DB0qC4d.jpg" ]
      
  # Objection!
  registerResponder
    triggers: [/objection!/i, /i object/i]
    responses: ["http://emotibot.net/pix/6186.gif"]
    
  # no idea dog
  registerResponder
    triggers: [/have no idea/i, /has no idea/i]
    responses: ["http://littlefun.org/uploads/520be02ac856117033000007_736.jpg#.png"]

