local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local response=((typeof(syn)=='table'and syn.request)or(typeof(http)=='table'and http.request)or(typeof(fluxus)=='table'and fluxus.request)or request or http_request)(
    {
        Url = "http://httpbin.org/get",
        Method = "GET",
    }
)
    
for i,v in pairs(response) do
    print(i,v)
    
    if type(v) == "table" then
        for i2,v2 in pairs(v) do
            warn(i2,v2)
        end
    end
end


local http_request = http_request;
if syn then
	http_request = syn.request
elseif SENTINEL_V2 then
	function http_request(tb)
		return {
			StatusCode = 200;
			Body = request(tb.Url, tb.Method, (tb.Body or ''))
		}
	end
end
 
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Krnl-Fingerprint", "Oxy-Fingerprint", "Sw-Fingerprint"};
local hwid = "";
 
for i, v in next, hwid_list do
	if decoded.headers[v] then
		hwid = decoded.headers[v];
		break
	end
end
 
if hwid then
	setclipboard(hwid)
	Notification.new("success", "Crip's Gaming Chair", "HardwareID pasted into Clipboard, send it to Crip") 
end
