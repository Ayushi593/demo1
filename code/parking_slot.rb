require_relative './vehicle'
require_relative './car'
require_relative './bike'
class ParkingSlot
	attr_accessor :id, :vehicle

  def initialize (id)
    @id = id.to_i
  end

  def park_vehicle(vehicle_number, vehicle_type)
  	if self.vehicle
      raise 'Vehicle already parked'
    else
    	vehicle_type = (vehicle_type == 'car') ? "Car" : "Bike"
      self.vehicle = eval(vehicle_type).new(vehicle_number)
    end
  end

  def is_slot_available
    self.vehicle == nil
  end

  def unpark
  	self.vehicle = nil
  end
end