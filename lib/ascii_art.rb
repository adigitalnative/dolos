class ASCIIArt


  def self.dolos
    ascii =<<-EOF
                                                                                  
8 888888888o.          ,o888888o.     8 8888         ,o888888o.       d888888o.   
8 8888    `^888.    . 8888     `88.   8 8888      . 8888     `88.   .`8888:' `88. 
8 8888        `88. ,8 8888       `8b  8 8888     ,8 8888       `8b  8.`8888.   Y8 
8 8888         `88 88 8888        `8b 8 8888     88 8888        `8b `8.`8888.     
8 8888          88 88 8888         88 8 8888     88 8888         88  `8.`8888.    
8 8888          88 88 8888         88 8 8888     88 8888         88   `8.`8888.   
8 8888         ,88 88 8888        ,8P 8 8888     88 8888        ,8P    `8.`8888.  
8 8888        ,88' `8 8888       ,8P  8 8888     `8 8888       ,8P 8b   `8.`8888. 
8 8888    ,o88P'    ` 8888     ,88'   8 8888      ` 8888     ,88'  `8b.  ;8.`8888 
8 888888888P'          `8888888P'     8 888888888888 `8888888P'     `Y8888P ,88P' 
EOF
  puts ascii.colorize(:red)
  end
                                                                                                       
end