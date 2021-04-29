require_relative './parking_slot'
require 'pry'
class ParkingLot
	attr_accessor :slots
	def initialize(slots)
		@slots = slots
		@slots.each do |vehicle_type, number_of_slots|
			create_slots(vehicle_type, number_of_slots)
		end
	end

	def park_vehicle(vehicle_number, vehicle_type)
		next_free_slot = next_free_slot(vehicle_type)
		unless next_free_slot.nil?
      puts "Allocated #{vehicle_type} slot #{ next_free_slot.id }"
      next_free_slot.park_vehicle(vehicle_number, vehicle_type)
    end
	end

	def unpark_vehicle(vehicle_number)
		vehicle_type, slot_number = find_slot(vehicle_number)
		slot_number = slot_number.to_i
    if slot_number >= 0 && slot_number <= @slots[vehicle_type].length
      @slots[vehicle_type][slot_number].unpark
      puts "Slot number #{ slot_number.to_i + 1} is now free "
    else
      puts "Invalid slot number"
    end
	end

	def find_vehicle(vehicle_number)
		vehicle_type, slot_number = find_slot(vehicle_number)
		"Your #{vehicle_type.to_s} is present in slot number #{slot_number + 1}"
	end

	def list_of_available_parking_slot
		@available_slots = {car: [], bike: []}
		@slots.each do |vehicle_type, slots|
			slots.each do |slot|
				@available_slots[vehicle_type] << slot if slot.is_slot_available
			end
		end
		@available_slots
	end

	private

	def find_slot(vehicle_number)
		@slots.each do |vehicle_type, slots|
			slots.each_with_index do |slot, index|
				unless slot.vehicle.nil?
					return vehicle_type.to_sym, index if slot.vehicle.vehicle_number == vehicle_number
				end
			end
		end
		raise "Vehicle no #{vehicle_number} is not parked"
	end

	def next_free_slot(vehicle_type)
		@slots[vehicle_type.to_sym].each do |slot|
			return slot if slot.is_slot_available
    end
    raise "Parking lot is full"
	end

	def create_slots(vehicle_type, total_slot_number)
		total_slot_number.to_i.times do |index|
      slot_number = index + 1
      @slots[vehicle_type] = [] if index == 0
      @slots[vehicle_type][index] = ParkingSlot.new(slot_number) 
    end
    puts "Created a parking lot for #{vehicle_type} with #{total_slot_number} slots"
	end
end


    