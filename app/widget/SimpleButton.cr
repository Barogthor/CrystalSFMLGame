#require "crsfml"


class SimpleButton < SF::RectangleShape

    def initialize(width : Int32, height : Int32 )
        super(SF.vector2(width,height))
        self.fill_color=SF::Color::Black
        self.outline_color=SF::Color::Red
        self.outline_thickness=5
        rotate(45)
    end

    def is_hover(posX : Float64, posY : Float64)
        minX, minY = self.position.x, self.position.y
        maxX = (self.position.x + size.x) * self.scale.x * Math.cos(self.rotation)
        maxY = (self.position.y + size.y) * self.scale.y * Math.sin(self.rotation)
        if minX <= posX && maxX >= posX && minY <= posY && maxY >= posY
            true
        else
            false
        end
    end

end