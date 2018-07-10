require 'pg'
class Bounty
  #
  # attr_reader :name, :species, :bounty_value, :danger_level

  def initialize(options)
    @name = options ['name']
    @species = options ['species']
    @bounty_value = options['bounty_value'].to_i
    @danger_level = options ['danger_level']
  end

  def update()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost' })
    sql = "UPDATE bounty_list SET (name,
    species, bounty_value, danger_level) = ($1,$2,$3,$4)
    WHERE id = $5"
    values = [ @name, @species, @bounty_value,
    @danger_level, @id ]
    db.prepare( "update" ,sql)
    db.exec_prepared("update" , values)
    db.close()
  end

  def save ()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost' } )
    sql ="INSERT INTO bounty_list (name,species,bounty_value, danger_level)
    VALUES ($1, $2, $3, $4)"
    values = [@name, @species, @bounty_value, @danger_level]
    db.prepare( "save" ,sql)
    db.exec_prepared("save" , values)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost' })
    sql = "DELETE FROM bounty_list WHERE id = $1"
    values = [ @id ]
    db.prepare( "delete" ,sql)
    db.exec_prepared("delete" , values)
    db.close()
  end

  def Bounty.find_bounty_by_name(name)
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "SELECT name FROM bounty_list WHERE name = $1"
    values = [ name ]
    db.prepare( "find_bounty_by_name" ,sql)
    found_bounties = db.exec_prepared("find_bounty_by_name" , values)
    db.close()
    return Bounty.new(found_bounties.first)
  end

  def Bounty.find_bounty_by_id(id)
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    sql = "SELECT id FROM bounty_list WHERE id = $1"
    values = [ id ]
    db.prepare( "find_bounty_by_id" ,sql)
    found_bounties = db.exec_prepared("find_bounty_by_id" , values)
    db.close()
    return Bounty.new(found_bounties.first)
  end
end
