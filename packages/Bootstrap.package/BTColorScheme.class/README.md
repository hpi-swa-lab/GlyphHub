A BTColorScheme is a triple of foreground, background and border colors. It is immutable, all functions create a copy that apply the requested changes. Since ColorSchemes are linked in various places, mutating one will lead to undefined and most likely unwated behavior.

# Modes and types
Types are one set of semantic colors, such as #danger for red or #success for green. Modes are modifiers for these sets that make them work in different contexts, such as light-on-dark vs dark-on-light settings.

# Creating new instances from the default palette
Primary way to create color schemes is via the "type:mode:" or "type:" class functions, which populates a ColorScheme with colors from the default palette. A ColorScheme created in this way keeps track of its type and mode and thereby allows for changing its mode while keeping its type, which is a required for colorscheme inheritance in widgets.

# Creating custom color instances
Custom ColorSchemes can be created via the "fg:bg:border" function, but won't benefit from automatic adaption for different modes along an inheritance tree.

# Background-less ColorSchemes
If you have a widget that has no background, simply set its background color to nil, state changes will then effect the foreground instead