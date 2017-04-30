local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()

local ButtonScheduling -- botao de agendamento

function scene:create(event)

	local grupoDeSena = self.view 

	ButtonScheduling = widget.newButton( {label="Scheduling", x = display.contentWidth/2 + 5, y =display.contentHeight/2 - 150, shape = "roundedRect" , fillColor = { default={1,1,0,1}, over={1,0.1,0.7,0.4}}, onPress = touchOnButtonScheduling } )
	grupoDeSena:insert(ButtonScheduling)

	ButtonProfile = widget.newButton( {label="Your Profile", x = display.contentWidth/2 + 5, y =display.contentHeight/2 - 50, shape = "roundedRect" , fillColor = { default={1,1,0,1}, over={1,0.1,0.7,0.4}}, onPress = touchOnButtonProfile } )
	grupoDeSena:insert(ButtonProfile)
end

function  touchOnButtonScheduling(event) -- toque no botao Scheduling 
	-- vai para a pagina de agendamento
	if event.phase == "began" then
		composer.gotoScene("Agendamento")
	end
	if event.phase == "ended" then
		print("xau")
	end
end

function  touchOnButtonProfile(event) -- toque no botao Profile 
	-- vai para a pagina de perfil
	if event.phase == "began" then
		composer.gotoScene("Perfil")
	end
	if event.phase == "ended" then
		print("xau")
	end
end

function scene:show(event)
end

function scene:hide(event)
end


function scene:destroy(event)
end

scene:addEventListener( "create", scene ) -- adiciona o evento da funcao de criar 
scene:addEventListener( "show", scene ) -- adiciona o evento da funcao de entre 
scene:addEventListener( "hide", scene ) -- adiciona o evento da funcao de sair
scene:addEventListener( "destroy", scene )-- adiciona o evento da funcao de destruir 

return scene
