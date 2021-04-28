require_relative './parking_lot'
require_relative './parking_slot'
require_relative './vehicle'
require_relative './car'
require_relative './bike'
require 'pry'
parking_lot1 = ParkingLot.new({car: 10, bike: 10})
parking_lot1.park_vehicle('12345', 'car')
parking_lot1.park_vehicle('123451', 'car')
parking_lot1.park_vehicle('123452', 'car')
parking_lot1.park_vehicle('123453', 'car')
parking_lot1.park_vehicle('123454', 'bike')
parking_lot1.park_vehicle('123455', 'bike')
parking_lot1.park_vehicle('123456', 'bike')
binding.pry
# parking_lot1.unpark_vehicle('12345')
puts "Ayushi"
