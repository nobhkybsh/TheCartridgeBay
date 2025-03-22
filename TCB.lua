--[[pod_format="raw",created="2025-03-22 06:36:01",modified="2025-03-22 06:36:01",revision=0]]
--[[	Thanks for using PicoNet Sitebuilder! I look forward
	to seeing your picosite! In order to make this available
	on PicoNet Explorer, you'll need to upload this lua file
	somewhere on the internet that you can get a link to it.
	Then, you'll want to go to the following thread:
	
		https://www.lexaloffle.com/bbs/?tid=140960
	
	and post your link based on the format provided there.
	it's  very possible that this format could change slightly
	and so I will not be listing that here just yet.
]]

	p = {
	title="The Cartridge Bay ",
	g=create_gui({
		x=0,y=0,
		width=256,height=256,
		fgcol = 0x090d
	}),
	copybuttons = {},
	init = function(self,explorer)
		local page = self
		add(self.copybuttons,self.g:attach({
			x=96, y=0, width=64, height=64,
			event = function(self,msg)
				if(msg.event == "release") then
					set_clipboard(pod({type="gif", w=64, h=64, frames=12, speed=1, clr=0, imgdata=page.gif2_gif_raw}))
					notify("gif added to clipboard")
				end
			end
		}))
		self.button5 = self.g:attach_button({
			x=82, y=124, width=96, height=16,
			label=" Solitaire Suite\n  ",
			click=function()
				download("https://raw.githubusercontent.com/nobhkybsh/TheCartridgeBay/refs/heads/main/Solitaire.p64","Solitaire.p64","/desktop")
			end
		})
	end,
	get_gui = function(self,explorer)
		return self.g
	end,
	draw = function(self,explorer)
		cls(0)
		self.gif2:draw(96,0,64,64,1,0)
		print("The\nCartridge\nBay\n\n ",96,64,7)
		print("    Category   //       Name       //   ULed\n            \n    Games >                             nob\n    Picotron ",0,96,7)
		
	end,
	update = function(self,explorer)
		
	end,
	gif2_gif_raw = "b64:bHo0AGIBAADTAwAA8zBweHUAQyhgAQAAEAAAAATw--_1AZ8QYA8gAW8QcBFOkB4hsAEfILARwB0BsCEekE4RcG4BDVCeAUABnlANAW4jAHkeDdAe0A0eIgDwEjABrlANAX5gEV6AHjGgHh2wHsAdHqAxHoBeEWB_AQ1AriIAGEAiAB-AIgAA-wwOeA8YDlANAQ5IDA5gEQ4oDA6AHgEcAaAeAg1RABLxCw0CHqABHAEegA4MKA4RYA4MSA4BDUAOeAwOXQAfDFwA-g_1AS4P_QE1IHEe4wAgQQ3jACAhDeMALx0BTgAYIAEd4QAgDSHhACENQeEAIHEeWAAgYS5YAO8xDR5gEQ4RDR6AHgENEVgAGSANEVgAIBEeWAAgMR5YAHRhLgEwAZ5gDwMXMU4ADzEDAQhOADcxHoAiAJGOcA0BXoARPqBTAxPAUwPioD4RgF4BDWCOAVABjmAiAAGYAyQdwJcDBCIAUAHw--_2",
	gif2 = new_gif("b64:bHo0AGIBAADTAwAA8zBweHUAQyhgAQAAEAAAAATw--_1AZ8QYA8gAW8QcBFOkB4hsAEfILARwB0BsCEekE4RcG4BDVCeAUABnlANAW4jAHkeDdAe0A0eIgDwEjABrlANAX5gEV6AHjGgHh2wHsAdHqAxHoBeEWB_AQ1AriIAGEAiAB-AIgAA-wwOeA8YDlANAQ5IDA5gEQ4oDA6AHgEcAaAeAg1RABLxCw0CHqABHAEegA4MKA4RYA4MSA4BDUAOeAwOXQAfDFwA-g_1AS4P_QE1IHEe4wAgQQ3jACAhDeMALx0BTgAYIAEd4QAgDSHhACENQeEAIHEeWAAgYS5YAO8xDR5gEQ4RDR6AHgENEVgAGSANEVgAIBEeWAAgMR5YAHRhLgEwAZ5gDwMXMU4ADzEDAQhOADcxHoAiAJGOcA0BXoARPqBTAxPAUwPioD4RgF4BDWCOAVABjmAiAAGYAyQdwJcDBCIAUAHw--_2",12)
}