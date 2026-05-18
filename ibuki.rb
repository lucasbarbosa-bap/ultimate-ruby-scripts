require 'gosu'

class IbukiGame < Gosu::Window
    def initialize
        super(500,350)
        self.caption = "IBUKI MIODA!"

        @fonte_titulo = Gosu::Font.new(30)
        @ibuki_seria = Gosu::Image.new("assets/sprites/ibuki_seria.png")
        @ibuki_feliz = Gosu::Image.new("assets/sprites/ibuki_feliz.png")
        @ibuki_acenando = Gosu::Image.new("assets/sprites/ibuki_acenando.png")
        @ibuki_grito = Gosu::Sample.new("assets/sounds/dr2_voice_hca.awb.03754.ogg")

        @x_botao = 200
        @y_botao = 10

        @largura_texto = @fonte_titulo.text_width("Gritar!")
        @x_texto = @x_botao + ((100 - @largura_texto) / 2)

        @escala_sprites = 300.0/@ibuki_seria.height
        @largura_sprite = @ibuki_seria.width * @escala_sprites
        @x_sprite = (500 - @largura_sprite) / 2
        @y_sprite = 50

        @gritando = false
    end

    def draw
        Gosu.draw_rect(0, 0, 500, 350, Gosu::Color.new(0xff_1a1a1a), 0)
        @fonte_titulo.draw_text("Gritar!", @x_texto, @y_botao + 2, 2, 1.0, 1.0, Gosu::Color::WHITE)
        Gosu.draw_rect(@x_botao, @y_botao, 100, 35, Gosu::Color.new(0xff_F225AA), 1)
        if @gritando == false
            @ibuki_seria.draw(@x_sprite, @y_sprite, 0, @escala_sprites, @escala_sprites)
        else
            case @nrg
            when 1
                @ibuki_acenando.draw(@x_sprite, @y_sprite, 0, @escala_sprites, @escala_sprites)
            when 2
                @ibuki_feliz.draw(@x_sprite, @y_sprite, 0, @escala_sprites, @escala_sprites)
            end
        end
    end
    
    def button_down(id)
        if id == Gosu::MS_LEFT && mouse_x > 200 && mouse_x < 300 && mouse_y > 10 && mouse_y < 45 && !@gritando
            puts "IBUKI MIODA!!"
            @gritando = true
            @ibuki_grito.play
            @nrg = rand(1..2)
            @tempo_grito = Gosu.milliseconds
        end
    end

    def update
        @gritando = false if @gritando && Gosu.milliseconds - @tempo_grito > 1000
    end
end

IbukiGame.new.show