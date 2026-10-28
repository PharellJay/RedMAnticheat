--EXPLANATION--
STEP 1:
Head to the Script you want to start via Clientloader and insert the following lines at the top of the fxmanifest.lua:

shared_script "@deadeye_clientloader/config/resources.lua"
shared_script "@deadeye_clientloader/shared/clientloader.lua"

AND (if it is not inserted already) ALSO THIS

lua54 "yes"

STEP 2:
Comment out / delete the files you want to start via Clientloader. Though note, only client files should be started like that!
For example this:
client_scripts {
    "client.lua",
}

Should look like this:
client_scripts {

}

Or this afterwards:
client_scripts {
    --"client.lua",
}

STEP 3:
Head to the Clienttloader file named resources.lua and open it.
In there you will add your script like shown in the following example:
["scriptname"] = {
    "client.lua", --or whatever the file is named
},

IMPORTANT NOTE:
You may also start Config files following this explanation but you may have to make sure you create a server sided config, so that the server file can still grab config values.
Though it is only important if you want to protect coordinates for example.
If you need any help with that, make sure to open a ticket on our discord.