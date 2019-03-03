#require "crsfml"


class Button < SF::RectangleShape
    def initialize(width : Int32, height : Int32 )
        super(SF.vector2(width,height))
        fill_color=SF::Color::Red
        rotate(45)
        puts fill_color
    end

    def is_hover(posX : Float64, posY : Float64)
       maxX= (position.x + size.x) * scale.x * Math.cos(rotation)
       maxY= (position.y + size.y) * scale.y * Math.sin(rotation)
        if position.x <= posX && maxX >= posX && position.y <= posY && maxY >= position.y
            true
        else
            false
        end
    end

end