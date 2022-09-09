on count_windows_on_current_space(process_name)
    tell application "System Events"
        tell process process_name
            return count of windows
        end tell
    end tell
end count_windows_on_current_space

tell application "Flow"
   if my count_windows_on_current_space("Flow") = 0 then
      hide
      show
   else
      hide
   end if
end tell
