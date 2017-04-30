local widget =  require ("widget")
local composer = require ("composer")
local scene = composer.newScene()

function scene:create(event)

	local grupoDeSena = self.view 	

	Buttonlogin = widget.newButton( {label="login", x = display.contentWidth/2, y = display.contentHeight/2, onPress = DiaMesAno} )
	grupoDeSena:insert(Buttonlogin)
end

function scene:show(event)
end

function scene:hide(event)
end

function scene:destroy(event)
end

function DiaMesAno(event)
	
	local dias = {}
	local anos = {}
	--local columnData

	--popular a tabela de dias
	for d = 1, 31 do
	    dias[d] = d
	end

	--popular tabela de anos
	for a = 1, 48 do
	    anos[a] = 2020 - a
	end


	local columnData = 
	{ 
		    { 
		        align = "center",
		        width = 124,
		        labelPadding = 20,
		        startIndex = 2,
		        labels = dias
		    },
		    {
		        align = "left",
		        width = 96,
		        labelPadding = 10,
		        startIndex = 1,
		       labels = {
		        "janeiro","fevereiro","março",
		        "abril","maio","junho","julho",
		        "agosto","setembro","outubro",
		        "novembro","dezembro"
		        }
		    },
		    {
		        align = "right",
		        width = 60,
		        labelPadding = 10,
		        startIndex = 3,
		        labels = anos
		    }
	}
	 
	-- Create the widget
	local pickerWheel = widget.newPickerWheel(
	{
	    x = display.contentCenterX,
	    top = display.contentHeight - 160,
	    columns = columnData,
	    style = "resizable",
	    width = 320,
	    rowHeight = 32,
	    fontSize = 14
	})
	 
	-- Get the table of current values for all columns
	-- This can be performed on a button tap, timer execution, or other event
	local values = pickerWheel:getValues()
	 
	-- Get the value for each column in the wheel, by column index
	local currentStyle = values[1].value
	local currentColor = values[2].value
	local currentSize = values[3].value
	 
	print( currentStyle, currentColor, currentSize )
end

scene:addEventListener( "create", scene ) -- adiciona o evento da funcao de criar 
scene:addEventListener( "show", scene ) -- adiciona o evento da funcao de entre 
scene:addEventListener( "hide", scene ) -- adiciona o evento da funcao de sair
scene:addEventListener( "destroy", scene )-- adiciona o evento da funcao de destruir 

return scene
