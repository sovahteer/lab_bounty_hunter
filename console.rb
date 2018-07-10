require_relative 'model/bounty'
require('pry')

bounty1 = Bounty.new(
  {'name' => "Jensen Tythe", 'species' => 'Human',
   'bounty_value' => 5, 'danger_level' => 'low'
 }
)

bounty2 = Bounty.new(
  {'name' => "Gar'venna", 'species' => 'Twilek',
   'bounty_value' => 50000, 'danger_level' => 'med'
 }
)

bounty1.save()
bounty2.save()

bounty2.delete()

# found_bounty = Bounty.find_bounty_by_name("Jensen Tythe")

found_bounty = Bounty.find_bounty_by_id(2)

binding.pry

nil
