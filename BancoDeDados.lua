local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()
-----------------------conectar ao banco de dados ------------------------
 sqlite3 = require( "sqlite3" )
 path = system.pathForFile( "data.db", system.DocumentsDirectory )
 db = sqlite3.open( path )
--------------------------------------------------------------------------

function scene:CriarBancoDeDados()
	 tablesetup = [[CREATE TABLE IF NOT EXISTS cliente (id INTEGER PRIMARY KEY autoincrement, nome, email, telefone, senha);]]
	variavel = db:exec( tablesetup )
	print("criacao do banco : " .. variavel)
end



-----------------------------------------------------------------------------------------
function scene:InserirNoBancoDeDados(nome, email, telefone, senha)
	local insertQuery = [[INSERT INTO cliente VALUES (NULL, ']]..nome..[[',']]..email..[[',']]..telefone..[[',']]..senha..[[');]]
	db:exec( insertQuery )
	print("mendagem do banco : " .. db:errmsg())
end


return scene