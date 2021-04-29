require_relative './parking_lot'
parking_lot1 = ParkingLot.new({car: 10, bike: 10})
parking_lot1.park_vehicle('car123', 'car')
parking_lot1.park_vehicle('car234', 'car')
parking_lot1.park_vehicle('car345', 'car')
parking_lot1.park_vehicle('car456', 'car')
parking_lot1.park_vehicle('bike123', 'bike')
parking_lot1.park_vehicle('bike234', 'bike')
parking_lot1.park_vehicle('bike345', 'bike')
parking_lot1.unpark_vehicle('car345')
parking_lot1.find_vehicle('bike234')
p parking_lot1.list_of_available_parking_slot
