local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()

-----------------------conectar ao banco de dados ------------------------
local sqlite3 = require( "sqlite3" )
 
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local db = sqlite3.open( path )
--------------------------------------------------------------------------

local LabelNome
local LabelEmail
local LabelTelefone
local LabelSenha
local TxtNome
local TxtEmail
local TxtTelefone
local TxtSenha
local ButtonCadastrar 

function CriarBancoDeDados(event)
	local tablesetup = [[CREATE TABLE IF NOT EXISTS cliente (id INTEGER PRIMARY KEY autoincrement, nome, email, telefone, senha);]]
	variavel = db:exec( tablesetup )
	print("criacao do banco : " .. variavel)
end

CriarBancoDeDados()

function InserirNoBancoDeDados(nome, email, telefone, senha)
	local insertQuery = [[INSERT INTO cliente VALUES (NULL, ']]..nome..[[',']]..email..[[',']]..telefone..[[',']]..senha..[[');]]
	db:exec( insertQuery )
	print("mendagem do banco : " .. db:errmsg())
end

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


	ButtonCadastrar =  widget.newButton( {label="cadastrar", x = display.contentWidth/2 + 100, y = display.contentHeight/2 ,onPress = RegisterCustomer} )
	grupoDeSena:insert(ButtonCadastrar)
end

function RegisterCustomer(event)

	if event.phase == "began" then
		InserirNoBancoDeDados(TxtNome.text, TxtEmail.text, TxtTelefone.text, TxtSenha.text)
		TxtNome.text = ""
		TxtEmail.text = ""
		TxtTelefone.text = ""
		TxtSenha.text = ""
		composer.gotoScene("login")
	end

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


