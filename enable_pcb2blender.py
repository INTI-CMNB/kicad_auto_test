import bpy

# Register the addon and enable it
bpy.context.preferences.filepaths.script_directory = '/usr/bin/3.5/scripts/'
bpy.ops.preferences.addon_install(filepath='./pcb2blender_importer_2-7.zip', target='PREFS')
bpy.ops.preferences.addon_enable(module='pcb2blender_importer')
bpy.ops.wm.save_userpref()
