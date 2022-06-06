fx = {
    use_saved_state = true,
    use_database = function(database)
        return {
            select = function(table, where)
                if use_saved_state then
                    local return_data = {}

                    for _,v in pairs(fx.state.database[database]) do
                        for key, value in pairs(where) do
                            if v[key] == value then
                                if table == "*" then
                                    table.insert(return_data, v)
                                else
                                    table.insert(return_data, v[table])
                                end
                            end
                        end
                    end

                    return return_data
                else
                    
                end
            end,

            insert = function(table) 
            
            end,

            update = function(table, where) 
            
            end,

            delete = function(table) 

            end,
        }
    end,
    state = {
        used_statements = {},
        database = {
            "users" = {
                {
                    user_id = 1,
                    username = "hey 1"
                },
                {
                    user_id = 2,
                    username = "hey 2"
                },
                {
                    user_id = 3,
                    username = "hey 3"
                },
                {
                    user_id = 4,
                    username = "hey 4"
                }
            }
        }
    }
}

for k,v in pairs(fx) do
    if type(v) == "function" then
        exports(k,v)
    end
end