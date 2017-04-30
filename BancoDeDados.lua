
local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()

function scene:create(event)
end

function scene:show(event)
end

function scene:hide(event)
end


function scene:destroy(event)
end
function CriarTabela()
end
--return bd

scene:addEventListener( "create", scene ) -- adiciona o evento da funcao de criar 
scene:addEventListener( "show", scene ) -- adiciona o evento da funcao de entre 
scene:addEventListener( "hide", scene ) -- adiciona o evento da funcao de sair
scene:addEventListener( "destroy", scene )-- adiciona o evento da funcao de destruir 

return scene