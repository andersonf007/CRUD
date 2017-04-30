local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()
local login = require ("Login")

local LabelNome
local LabelEmail
local LabelTelefone
local LabelSenha
local TxtNome
local TxtEmail
local TxtTelefone
local TxtSenha
local ButtonSave 
--[[
variavel = login.StoreID()
print(variavel)
]]
function scene:create(event)

	local grupoDeSena = self.view 
	
	LabelNome = display.newText({text="Nome :",x=display.contentWidth/2 - 125,y=display.contentHeight/2 - 200})
	grupoDeSena:insert(LabelNome)
	

	LabelEmail = display.newText({text="Email :",x=display.contentWidth/2 - 125,y=display.contentHeight/2 - 150})	
	grupoDeSena:insert(LabelEmail)


	LabelTelefone = display.newText({text="Telefone :",x=display.contentWidth/2 - 115,y=display.contentHeight/2 - 100})	
	grupoDeSena:insert(LabelTelefone)


	LabelSenha = display.newText({text="Senha :",x=display.contentWidth/2 - 120,y=display.contentHeight/2 - 50})
	grupoDeSena:insert(LabelSenha)


	ButtonSave =  widget.newButton( {label="save", x = display.contentWidth/2 + 100, y = display.contentHeight/2 } )
	grupoDeSena:insert(ButtonSave)
end

function scene:show(event)
	if event.phase == "did" then
		TxtNome = native.newTextField(display.contentWidth/2 + 5, display.contentHeight/2 - 200, 200, 25 ) 
		TxtEmail = native.newTextField(display.contentWidth/2 + 5, display.contentHeight/2 - 150, 200, 25 ) 
		TxtTelefone = native.newTextField(display.contentWidth/2 + 15, display.contentHeight/2 - 100, 178, 25 ) 
		TxtTelefone.inputType = "number"
		TxtSenha = native.newTextField(display.contentWidth/2 + 9, display.contentHeight/2 - 50, 190, 25 ) 
	end
end

function scene:hide(event)	
	display.remove(TxtNome)
	display.remove(TxtEmail)
	display.remove(TxtEmail)
	display.remove(TxtTelefone)
	display.remove(TxtSenha)
end

function scene:destroy(event)
end

scene:addEventListener( "create", scene ) -- adiciona o evento da funcao de criar 
scene:addEventListener( "show", scene ) -- adiciona o evento da funcao de entre 
scene:addEventListener( "hide", scene ) -- adiciona o evento da funcao de sair
scene:addEventListener( "destroy", scene )-- adiciona o evento da funcao de destruir 

return scene
