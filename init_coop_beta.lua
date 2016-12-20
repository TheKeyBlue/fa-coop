-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-- CHANGE ONLY THESE TWO VARIABLES, UNLESS YOU KNOW WHAT YOU'RE DOING 
--
-- If your fa-coop and faf-coop-maps repositories aren't in your C:/Users/USERNAME/Documents folder,
-- then you'll have to change either or both of the following two lines to contain the actual paths.
--
-- SHGetFolderPath('PERSONAL') will give this -> C:\\Users/USERNAME\\Documents\\

fa_coop_dev_path = SHGetFolderPath('PERSONAL') .. 'GitHub\\fa-coop'
faf_coop_maps_dev_path = SHGetFolderPath('PERSONAL') .. 'GitHub\\faf-coop-maps\\'

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

sc_path = "C:\\Program Files (x86)\\THQ\\Gas Powered Games\\Supreme Commander"

dofile(InitFileDir .. '\\..\\fa_path.lua')
 
path = {}
 
whitelist =
{
    "effects.nx2",
    "env.nx2",
    "etc.nx2",
    "loc.nx2",
    "lua.nx2",
    "meshes.nx2",
    "mods.nx2",
    "modules.nx2",
    "projectiles.nx2",
    "schook.nx2",
    "textures.nx2",
    "units.nx2",    
    "murderparty.nxt",
    "labwars.nxt",
    "units.scd",
    "textures.scd",
    "skins.scd",
    "schook.scd",
    "props.scd",
    "projectiles.scd",
    "objects.scd",
    "moholua.scd",
    "mohodata.scd",
    "mods.scd",
    "meshes.scd",
    "lua.scd",
    "loc_us.scd",
    "loc_es.scd",
    "loc_fr.scd",
    "loc_it.scd",
    "loc_de.scd",
    "loc_ru.scd",
    "env.scd",
    "effects.scd",
    "editor.scd",
    "ambience.scd",
    "advanced strategic icons.nxt",
    "lobbymanager.scd",
    "texturepack.nxt",
    "sc_music.scd"
}
 
local function mount_dir(dir, mountpoint)
    table.insert(path, { dir = dir, mountpoint = mountpoint } )
end
 
 
local function mount_contents(dir, mountpoint)
    LOG('checking ' .. dir)
    for _,entry in io.dir(dir .. '\\*') do
        if entry != '.' and entry != '..' then
            local mp = string.lower(entry)
            local safe = true
                mp = string.gsub(mp, '[.]scd$', '')
                mp = string.gsub(mp, '[.]zip$', '')
                mount_dir(dir .. '\\' .. entry, mountpoint .. '/' .. mp)
        end
    end
end
 
local function mount_dir_with_whitelist(dir, glob, mountpoint)
    sorted = {}
    LOG('checking ' .. dir .. glob)
    for _,entry in io.dir(dir .. glob) do
        if entry != '.' and entry != '..' then
            local mp = string.lower(entry)
            local notsafe = true
            for i, white in whitelist do
                notsafe = notsafe and (string.find(mp, white, 1) == nil)
            end
            if notsafe then
                LOG('not safe ' .. dir .. entry)                                
            else
                table.insert(sorted, dir .. entry)
            end
        end
    end
    table.sort(sorted)
    table.foreach(sorted, function(k,v) mount_dir(v,'/') end)
end
 
local function mount_dir_with_blacklist(dir, glob, mountpoint)
    sorted = {}
    LOG('checking ' .. dir .. glob)
    for _,entry in io.dir(dir .. glob) do
        if entry != '.' and entry != '..' then
            local mp = string.lower(entry)
            local safe = true
            for i, black in blacklist do
                safe = safe and (string.find(mp, black, 1) == nil)
            end
            if safe then
                table.insert(sorted, dir .. entry)
            else
                LOG('not safe ' .. dir .. entry)
            end
        end
    end
    table.sort(sorted)
    table.foreach(sorted, function(k,v) mount_dir(v,'/') end)
end
 
local function mount_map_dir(dir, glob, mountpoint)
    LOG('mounting maps from: '..dir)
    mount_contents(dir, mountpoint)
 
    for _, map in io.dir(dir..glob) do
        for _, folder in io.dir(dir..'\\'..map..'\\**') do
            if folder == 'movies' then
                LOG('Found map movies in: '..map)
                mount_dir(dir..map..'\\movies', '/movies')
            elseif folder == 'sounds' then
                LOG('Found map sounds in: '..map)
                mount_dir(dir..map..'\\sounds', '/sounds')
            end
        end
    end
end

-- mount maps
mount_map_dir(faf_coop_maps_dev_path, '**', '/maps')
mount_map_dir(InitFileDir .. '\\..\\user\\GitHub\\faf-coop-maps\\', '**', '/maps')
 
-- mount mods
mount_contents(SHGetFolderPath('PERSONAL') .. 'My Games\\Gas Powered Games\\Supreme Commander Forged Alliance\\mods', '/mods')
mount_contents(InitFileDir .. '\\..\\user\\My Games\\Gas Powered Games\\Supreme Commander Forged Alliance\\mods', '/mods')

mount_dir(fa_coop_dev_path, '/')
 
mount_dir(InitFileDir .. '\\..\\gamedata\\*.cop', '/')
mount_dir_with_whitelist(InitFileDir .. '\\..\\gamedata\\', '*.nxt', '/')
mount_dir_with_whitelist(InitFileDir .. '\\..\\gamedata\\', '*.nx2', '/')
 
mount_dir_with_whitelist(fa_path .. '\\gamedata\\', '*.scd', '/')
mount_dir(InitFileDir .. '\\..\\extra', '/')
mount_dir(fa_path, '/')
mount_dir(sc_path .. '\\movies', '/movies')
 
 
 
hook = {
    '/schook',
    '/mods/coop/hook'
}
 
 
 
protocols = {
    'http',
    'https',
    'mailto',
    'ventrilo',
    'teamspeak',
    'daap',
    'im',
}