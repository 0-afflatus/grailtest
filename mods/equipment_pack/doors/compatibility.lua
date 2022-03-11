minetest.get_node_above = function ( pos, off )
        return minetest.get_node( { x = pos.x, y = pos.y + ( off or 1 ), z = pos.z } )
end

vector.offset_y = function ( pos, y )
        return { x = pos.x, y = pos.y + ( y or 1 ), z = pos.z }
end