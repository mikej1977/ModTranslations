# Mod Translations

Translation JSON file goes in folder: yourModName/media/lua/shared/ModTranslations/LANG_THINGY/  
-- this can be in 42 folder, common folder, whatevs  
  -- for reference, my translations file is in Logging/common/media/lua/shared/ModTranslations/EN/  
-- supports all translation languages, EN, PTBR, RU, DE, etc  
-- defaults to EN if no translation found in selected language  

Usage:   
  -- Init the translations  
    LoadModTranslations("JBLogging", "jb_logging_translations")  
    
  -- Use in your mod  
    getText("JBLogging", "Planks_Storage")  

    jb_logging_translations.json located in common/media/lua/shared/ModTranslations/EN/  
    
    { 
      "Log_Storage": "Logs Storage",
      "Planks_Storage": "Planks Storage",
      "Twigs_Storage": "Twigs & Branches Storage",
      "Firewood_Storage": "Firewood Storage",
    }
