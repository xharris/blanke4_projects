--[[
	mainState state code
]]--

local mainState = {}

--[[
[{
"department":"AFST",
"description":"Understanding the black experience in the African diaspora. A survey of historical and sociocultural ties that link people of African descent worldwide. African roots in world civilizations are discussed. This course is an introductory course for majors and nonmajors.",
"level":100,
"name":"Introduction to The Black Experience",
"sections":[
	{"campus":"Main Campus",
	"career":"Undergraduate",
	"class_attributes":"Arts and Humanities (GEP)\nArts and Humanities (GFR)",
	"class_capacity":"30",
	"class_number":"1716",
	"components":"Lecture Required",
	"dates":"08/30/2017 - 12/12/2017",
	"grading":"",
	"instructor(s)":"Tammy Henderson",
	"location":"Univ of MD, Baltimore County",
	"meets":"TuTh 1:00pm - 2:15pm",
	"room":"Janet & Walter Sondheim  208",
	"session":"Regular Academic Session",
	"status":"Open",
	"units":"3 units",
	"wait_list_capacity":"0"},

	{"campus":"Main Campus","career":"Undergraduate","class_attributes":"Arts and Humanities (GEP)\nArts and Humanities (GFR)","class_capacity":"30","class_number":"1717","components":"Lecture Required","dates":"08/30/2017 - 12/12/2017","grading":"","instructor(s)":"Damon Turner","location":"Univ of MD, Baltimore County","meets":"TuTh 11:30am - 12:45pm","room":"Janet & Walter Sondheim  207","session":"Regular Academic Session","status":"Open","units":"3 units","wait_list_capacity":"0"},
	{"campus":"Main Campus","career":"Undergraduate","class_attributes":"Arts and Humanities (GEP)\nArts and Humanities (GFR)","class_capacity":"30","class_number":"7167","components":"Lecture Required","dates":"08/30/2017 - 12/12/2017","grading":"","instructor(s)":"Maleda Belilgne","location":"Univ of MD, Baltimore County","meets":"MoWeFr 10:00am - 10:50am","room":"Sherman Hall 011","session":"Regular Academic Session","status":"Open","units":"3 units","wait_list_capacity":"0"}],
"title":"AFST 100"}]

]]--


-- Called once, and only once, before entering the state the first time.
function mainState:init()
	local result = http.get("http://api.umbc.me/v0/classInfo?class=cmsc 331")
  	print_r(result.data)
end



-- Called every time when entering the state.
function mainState:enter(previous)
  	
end

function mainState:leave()

end 

function mainState:update(dt)

end

function mainState:draw()
  
end	

return mainState