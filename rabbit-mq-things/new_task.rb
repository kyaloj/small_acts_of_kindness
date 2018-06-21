#!/usr/bin/env ruby

require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
durable_queue = channel.queue('durable_queue', durable: true)

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')
durable_queue.publish(message, persistent: true)
puts " [x] Sent #{message}"

connection.close