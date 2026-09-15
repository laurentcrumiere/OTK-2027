$PBExportHeader$uo_toolbar.sru
forward
global type uo_toolbar from nonvisualobject
end type
end forward

global type uo_toolbar from nonvisualobject
end type
global uo_toolbar uo_toolbar

forward prototypes
public subroutine restore (ref window mdi_win, string ini_file, string ini_section)
public subroutine save (readonly window mdi_win, string ini_file, string ini_section)
end prototypes

public subroutine restore (ref window mdi_win, string ini_file, string ini_section);// Restore toolbar settings for the passed window

integer index, row, offset, x, y, w, v_h
boolean visible
string visstring, alignstring, title
toolbaralignment alignment




FOR index = 1 to 5	//5 toolbars max

	// Depuis la version 2009.1, les toolbar 1 et 2 sont invisibles !!!
	mdi_win.SetToolbar(index, false, alignment, title)

	
//	// Try to get the attributes for the bar.
//	IF mdi_win.GetToolbar(index, visible, alignment, title)= 1 THEN
//		// Try to get the attributes from the .ini
//		// file
//		visstring = ProfileString(ini_file, ini_section + String(index), "visible", "")
//		IF visstring > "" THEN
//			// Get all of the attributes
//			alignstring = ProfileString(ini_file, ini_section + String(index), "alignment", "left")
//			title = ProfileString(ini_file, ini_section + String(index), "title", "(Untitled)")
//			row = Integer(ProfileString(ini_file, ini_section + String(index), "row", "1"))
//			offset = Integer(ProfileString(ini_file, ini_section + String(index), "offset", "0"))
//			x = Integer(ProfileString(ini_file, ini_section + String(index), "x", "0"))
//			y = Integer(ProfileString(ini_file, ini_section + String(index), "y", "0"))
//			w = Integer(ProfileString(ini_file, ini_section + String(index), "w", "0"))
//			h = Integer(ProfileString(ini_file, ini_section + String(index), "h", "0"))
//
//			// Convert visstring to a boolean
//			CHOOSE CASE visstring
//				CASE "true"
//					visible = true
//				CASE "false"
//					visible = false
//			END CHOOSE
//
//			// Convert alignstring to toolbaralignment
//			CHOOSE CASE alignstring
//				CASE "left"
//					alignment = AlignAtLeft!
//				CASE "top"
//					alignment = AlignAtTop!
//				CASE "right"
//					alignment = AlignAtRight!
//				CASE "bottom"
//					alignment = AlignAtBottom!
//				CASE "floating"
//					alignment = Floating!
//			END CHOOSE
//
//			// Set the new position
//			mdi_win.SetToolbar(index, visible, alignment, title)
//			mdi_win.SetToolbarPos(index, row, offset, false)
//			mdi_win.SetToolbarPos(index, x, y, w, h)
//		END IF
//	END IF
NEXT

end subroutine

public subroutine save (readonly window mdi_win, string ini_file, string ini_section);// Store the toolbar settings for the passed window
integer index, row, offset, x, y, w, h
boolean visible
string visstring, alignstring, title
toolbaralignment alignment

FOR index = 1 to 5	//5 toolbars max
	// Try to get the attributes for the bar.
	IF mdi_win.GetToolbar(index, visible, alignment, &
			title)= 1 THEN
		// Convert visible to a string
		CHOOSE CASE visible
			CASE true
				visstring = "true"
			CASE false
				visstring = "false"
		END CHOOSE

		// Convert alignment to a string
		CHOOSE CASE alignment
			CASE AlignAtLeft!
				alignstring = "left"
			CASE AlignAtTop!
				alignstring = "top"
			CASE AlignAtRight!
				alignstring = "right"
			CASE AlignAtBottom!
				alignstring = "bottom"
			CASE Floating!
				alignstring = "floating"
		END CHOOSE

		// Save the basic attributes
		SetProfileString(ini_file, ini_section +  &
			String(index), "visible", visstring)
		SetProfileString(ini_file, ini_section +  &
			String(index), "alignment", alignstring)
		SetProfileString(ini_file, ini_section +  &
			String(index), "title", title)
		// Save the fixed position
		mdi_win.GetToolbarPos(index, row, offset)
		SetProfileString(ini_file, ini_section +  &
			String(index), "row", String(row))
		SetProfileString(ini_file, ini_section +  &
			String(index), "offset", String(offset))
		// Save the floating position
		mdi_win.GetToolbarPos(index, x, y, w, h)
		SetProfileString(ini_file, ini_section +  &
			String(index), "x", String(x))
		SetProfileString(ini_file, ini_section +  &
			String(index), "y", String(y))
		SetProfileString(ini_file, ini_section +  &
			String(index), "w", String(w))
		SetProfileString(ini_file, ini_section +  &
			String(index), "h", String(h))
	END IF
NEXT

end subroutine

on uo_toolbar.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_toolbar.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

