local widget =  require ("widget") -- para os botoes
local composer = require ("composer") -- para as telas
local scene = composer.newScene()
local BancoDeDados = require ("BancoDeDados")

local LabelUser
local LabelPassword
local TxtUserName
local TxtPassword
local Buttonlogin
local ButtonSingIn
local storeID -- armazenar id

function scene:create(event)
	
	local grupoDeSena = self.view 	

	LabelUser = display.newText({text="UserName",x=display.contentWidth/2,y=display.contentHeight/2 - 23})
	LabelUser:setFillColor(0,1,0)
	grupoDeSena:insert(LabelUser)

	LabelPassword = display.newText({text="Password",x=display.contentWidth/2,y=display.contentHeight/2 + 25})
	LabelPassword:setFillColor(0,1,0)
	grupoDeSena:insert(LabelPassword)

	Buttonlogin = widget.newButton( {label="login", x = display.contentWidth/2, y = display.contentHeight/2 + 80, onPress = touchOnButtonLogin} )
	grupoDeSena:insert(Buttonlogin)

	ButtonSingIn = widget.newButton( {label="Register", x = display.contentWidth/2 + 100, y = display.contentHeight/2 + 150, onPress = touchOnButtonRegister} )
	grupoDeSena:insert(ButtonSingIn)
end

function StoreID(id)

	ID = id
	
end

function touchOnButtonLogin(event) -- toque no botao de login

	if event.phase == "began" then
		for row in db:nrows("SELECT * FROM cliente") do
    	--print( "Row id " .. row.id )
    		if row.nome == TxtUserName.text or row.email == TxtUserName.text then
    			if row.senha == TxtPassword.text then
    			--	print( "Row id2 " .. row.id )
    			StoreID(row.id)
    			composer.gotoScene("logado")
    			end
    		end
    	end    	
	end
end

function  touchOnButtonRegister(event) -- toque no botao sing in 
	-- vai para a pagina de cadastro
	if event.phase == "began" then
		composer.gotoScene("CadastrarCliente")
	end
	if event.phase == "ended" then
		print("xau")
	end
end

function scene:show(event) 

	if event.phase == "did" then
		TxtUserName = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 25 )
		TxtPassword = native.newTextField(display.contentWidth/2, display.contentHeight/2 + 50, 150, 25 )
	end
end

function scene:hide(event)
	if event.phase == "will" then
		TxtUserName:removeSelf() 
		TxtPassword:removeSelf()
	end	
end

function scene:destroy(event)
end

scene:addEventListener( "create", scene ) -- adiciona o evento da funcao de criar 
scene:addEventListener( "show", scene ) -- adiciona o evento da funcao de entre 
scene:addEventListener( "hide", scene ) -- adiciona o evento da funcao de sair
scene:addEventListener( "destroy", scene )-- adiciona o evento da funcao de destruir 

return scene











--[[
local email = "username@domain.com"
 
if ( email:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?") ) then
   print( email.." IS formatted properly." )
else
   print( email.." is NOT formatted properly." )
end
]]---
