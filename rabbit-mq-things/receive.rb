#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
durable_queue = channel.queue('durable_queue', durable: true)
channel.prefetch(1)

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  durable_queue.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, body|
    puts " [x] Received #{body}"
    # imitate some work
    sleep body.count('.').to_i
    puts ' [x] Done'
    channel.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
