DEBUG = falselast_frame_touched = {}curr_frame_touched = {}function onTouched(touched_object)		if DEBUG then LogError("Touched " .. GetObjectName(touched_object:GetObject())) end		Character.SetIsVisibleInSightQueries(touched_object:GetObject(), false)	curr_frame_touched[GetObjectName(touched_object:GetObject())] = touched_objectendfunction onUntouched(obj)	if DEBUG then LogError("Untouched " .. GetObjectName(obj:GetObject())) end		Character.SetIsVisibleInSightQueries(obj:GetObject(), true)endfunction onUpdate()	for k,v in pairs(last_frame_touched) do		is_untouched = true		for ck,cv in pairs(curr_frame_touched) do			if k == ck then is_untouched = false end		end				if is_untouched then			onUntouched(v)		end	end		last_frame_touched = curr_frame_touched	curr_frame_touched = {}end