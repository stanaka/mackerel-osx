#! /usr/bin/env ruby

$ioreg = `ioreg -r -n AppleSmartBattery`
$now = Time.now

def asb(item)
  ret = $ioreg.match(/(#{item})[\"= ]+(\d+)$/)
  ret[2].to_i
end

puts "battery.capacity.MaxCapacity\t#{asb("MaxCapacity")}\t#{$now.to_i}"
puts "battery.capacity.CurrentCapacity\t#{asb("CurrentCapacity")}\t#{$now.to_i}"
puts "battery.cycle.CycleCount\t#{asb("CycleCount")}\t#{$now.to_i}"
puts "battery.temperature.Temperature\t#{asb("Temperature").to_f / 100}\t#{$now.to_i}"
puts "battery.timeremaining.TimeRemaining\t#{asb("TimeRemaining")}\t#{$now.to_i}"
