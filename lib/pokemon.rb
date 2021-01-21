class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(name:, type:, id: nil, db:)
        self.name = name
        self.type = type
        self.id = id
        self.db = db
    end

    # def self.save(name, type, db)
    #     db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
    # end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        pokemon = db.execute(sql, name, type)
    end
    
    def self.new_from_db(row)
        Pokemon.new(name: row[2],type: row[2], id: row[0], db: @db)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon = db.execute(sql, id).first
        Pokemon.new(name: pokemon[1], id: pokemon[0], type: pokemon[2], db: db)
    end
end
