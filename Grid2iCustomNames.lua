local Name = Grid2.statusPrototype:new("iCustomName")

Name.IsActive = Grid2.statusLibrary.IsActive

function Name:UNIT_NAME_UPDATE(_, unit)
	self:UpdateIndicators(unit)
end

function Name:OnEnable()
	self:RegisterEvent("UNIT_NAME_UPDATE")
end

function Name:OnDisable()
	self:UnregisterEvent("UNIT_NAME_UPDATE")
end

function Name:GetText(unit)
	local name = UnitName(unit)
	return iCN_GetName(name) or ""
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Name, {"text"}, baseKey, dbx)
	return Name
end

Grid2.setupFunc["iCustomName"] = Create

Grid2:DbSetStatusDefaultValue( "iCustomName", {type = "iCustomName"})
