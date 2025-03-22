--[[pod_format="raw",created="2025-03-22",modified="2025-03-22",revision=1]]
p = {
    title = "The Cartridge Bay",
    cartridges = {
        {
            category = "Games",
            name = "Solitaire Suite",
            author = "nob",
            url = "https://raw.githubusercontent.com/nobhkybsh/TheCartridgeBay/main/Solitaire.p64",
            filename = "Solitaire.p64"
        },
        -- Добавьте больше картриджей здесь в том же формате
    },
    
    init = function(self, explorer)
        self.g = create_gui({
            x = 0, y = 0,
            width = 480, height = 270,  -- Стандартное разрешение Picotron
            fgcol = 0x090d
        })
        
        -- Заголовок
        self.g:attach({
            x = 10, y = 10,
            width = 460, height = 32,
            draw = function(self)
                rect(self.x, self.y, self.x + self.width - 1, self.y + self.height - 1, 8)
                print("The Cartridge Bay", self.x + 8, self.y + 12, 7)
            end
        })
        
        -- Список картриджей
        self.list = self.g:attach({
            x = 10, y = 50,
            width = 460, height = 200,
            scroll = 0
        })
        
        self:refresh_list()
    end,
    
    refresh_list = function(self)
        -- Очистка предыдущих элементов
        if self.list.children then
            for i = #self.list.children, 1, -1 do
                self.list:detach(self.list.children[i])
            end
        end
        
        -- Шапка таблицы
        self.list:attach({
            x = 0, y = 0,
            width = 460, height = 16,
            draw = function(self)
                print("Category     Name           Author     Download", 
                      self.x + 4, self.y + 4, 7)
            end
        })
        
        -- Добавление картриджей
        for i, cart in ipairs(self.cartridges) do
            local y_pos = (i * 20) + 16
            local entry = self.list:attach({
                x = 0, y = y_pos,
                width = 460, height = 20
            })
            
            -- Текст записи
            entry:attach({
                x = 4, y = 2,
                draw = function(self)
                    local line = string.format("%-12s %-14s %-10s",
                        cart.category, cart.name, cart.author)
                    print(line, self.x, self.y, 7)
                end
            })
            
            -- Кнопка скачивания
            entry:attach_button({
                x = 360, y = 0,
                width = 90, height = 16,
                label = "Download",
                click = function()
                    download(cart.url, cart.filename, "/desktop")
                    notify("Downloading " .. cart.name .. " to /desktop")
                end
            })
        end
    end,
    
    get_gui = function(self, explorer)
        return self.g
    end,
    
    draw = function(self, explorer)
        cls(0)  -- Черный фон
    end,
    
    update = function(self, explorer)
        -- Здесь можно добавить динамическое обновление
    end,
    
    -- Обновленный GIF (простой пример, можно заменить)
    gif_raw = "b64:bHo0AGIBAADTAwAA8zBweHUAQyhgAQAAEAAAAATw--_1AZ8QYA8gAW8QcBFOkB4hsAEfILARwB0BsCEekE4RcG4BDVCeAUABnlANAW4jAHkeDdAe0A0eIgDwEjABrlANAX5gEV6AHjGgHh2wHsAdHqAxHoBeEWB_AQ1AriIAGEAiAB-AIgAA-wwOeA8YDlANAQ5IDA5gEQ4oDA6AHgEcAaAeAg1RABLxCw0CHqABHAEegA4MKA4RYA4MSA4BDUAOeAwOXQAfDFwA-g_1AS4P_QE1IHEe4wAgQQ3jACAhDeMALx0BTgAYIAEd4QAgDSHhACENQeEAIHEeWAAgYS5YAO8xDR5gEQ4RDR6AHgENEVgAGSANEVgAIBEeWAAgMR5YAHRhLgEwAZ5gDwMXMU4ADzEDAQhOADcxHoAiAJGOcA0BXoARPqBTAxPAUwPioD4RgF4BDWCOAVABjmAiAAGYAyQdwJcDBCIAUAHw--_2",
    gif = new_gif("b64:bHo0AGIBAADTAwAA8zBweHUAQyhgAQAAEAAAAATw--_1AZ8QYA8gAW8QcBFOkB4hsAEfILARwB0BsCEekE4RcG4BDVCeAUABnlANAW4jAHkeDdAe0A0eIgDwEjABrlANAX5gEV6AHjGgHh2wHsAdHqAxHoBeEWB_AQ1AriIAGEAiAB-AIgAA-wwOeA8YDlANAQ5IDA5gEQ4oDA6AHgEcAaAeAg1RABLxCw0CHqABHAEegA4MKA4RYA4MSA4BDUAOeAwOXQAfDFwA-g_1AS4P_QE1IHEe4wAgQQ3jACAhDeMALx0BTgAYIAEd4QAgDSHhACENQeEAIHEeWAAgYS5YAO8xDR5gEQ4RDR6AHgENEVgAGSANEVgAIBEeWAAgMR5YAHRhLgEwAZ5gDwMXMU4ADzEDAQhOADcxHoAiAJGOcA0BXoARPqBTAxPAUwPioD4RgF4BDWCOAVABjmAiAAGYAyQdwJcDBCIAUAHw--_2", 12)
}
