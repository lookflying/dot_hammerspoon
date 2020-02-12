hs.loadSpoon("WinWin")

hs.fnutils.each(hs.application.runningApplications(), function(app) 
    if not app.visibleWindows then 
        print(app) 
    end 
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "h", function()
    local win = hs.window.frontmostWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    --  f.y = max.y
    f.w = max.w / 2
    --  f.h = max.h
    if (f.x - max.x + f.w) > max.w then
        f.w = max.w - (f.x - max.x)
    end
    if (f.y - max.y + f.h) > max.h then
        f.y = max.h - (f.y - max.y)
    end
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "l", function()
    local win = hs.window.frontmostWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + max.w / 2
    --  f.y = max.y
    f.w = max.w / 2
    -- f.h = max.h
    if (f.x - max.x + f.w) > max.w then
        f.w = max.w - (f.x - max.x)
    end
    if (f.y - max.y + f.h) > max.h then
        f.y = max.h - (f.y - max.y)
    end
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "k", function()
    local win = hs.window.frontmostWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    --  f.x = max.x
    f.y = max.y
    --f.w = max.w
    f.h = max.h / 2
    if (f.x - max.x + f.w) > max.w then
        f.w = max.w - (f.x - max.x)
    end
    if (f.y - max.y + f.h) > max.h then
        f.y = max.h - (f.y - max.y)
    end
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "j", function()
    local win = hs.window.frontmostWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    --  f.x = max.x
    f.y = max.y + max.h / 2
    --  f.w = max.w
    f.h = max.h / 2
    if (f.x - max.x + f.w) > max.w then
        f.w = max.w - (f.x - max.x)
    end
    if (f.y - max.y + f.h) > max.h then
        f.y = max.h - (f.y - max.y)
    end
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "f", function()
    local win = hs.window.frontmostWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if f.x == max.x and f.y  == max.y and f.w == max.w and f.h == max.h then
        f.x = max.x + max.w / 4
        f.y = max.y + max.h / 4
        f.w = max.w / 2
        f.h = max.h / 2
    else
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
    end
    if (f.x - max.x + f.w) > max.w then
        f.w = max.w - (f.x - max.x)
    end
    if (f.y - max.y + f.h) > max.h then
        f.y = max.h - (f.y - max.y)
    end
    win:setFrame(f)
end)

--left to right sort
function get_sorted_screens()
    local screens = hs.screen.allScreens()
    table.sort(screens, function(a, b)
        return a:fullFrame().x < b:fullFrame().x
    end)
    return screens
end

--right to left sort
function get_reversed_sorted_screens()
    local screens = hs.screen.allScreens()
    table.sort(screens, function(a, b)
        return a:fullFrame().x > b:fullFrame().x
    end)
    return screens
end


function move_window_to_screen(window, screen)
    local f = window:frame()
    local s_f = screen:fullFrame()
    f.x = s_f.x
    if f.w > s_f.w then
        f.w = s_f.w
    end
    if f.y < s_f.y then
        f.y = s_f.y
    end
    if f.h > s_f.h then
        f.h = s_f.h
    end
    if f.h + f.y > s_f.h + s_f.y then
        f.y = s_f.y + (s_f.h - f.h)
    end
    window:setFrame(f)
end



hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Right", function()
    spoon.WinWin:moveToScreen("right")
    --local win = hs.window.frontmostWindow()
    --local f = win:frame()
    --local screen = win:screen()
    --sorted_screens = get_sorted_screens()
    --target_screen = hs.fnutils.find(sorted_screens, function(bscreen)
    --    return bscreen:fullFrame().x > screen:fullFrame().x
    --end)
    --if target_screen ~= nil then
    --    move_window_to_screen(win, target_screen)
    --end
    --hs.notify.new({title="test", informativeText="x="..f.x.."y="..f.y.."screen x="..screen:fullFrame().x.."screen y="..screen:fullFrame().y}):send()
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Left", function()
    spoon.WinWin:moveToScreen("left")
    --local win = hs.window.frontmostWindow()
    --local f = win:frame()
    --local screen = win:screen()
    --sorted_screens = get_reversed_sorted_screens()
    --target_screen = hs.fnutils.find(sorted_screens, function(bscreen)
    --    return bscreen:fullFrame().x < screen:fullFrame().x
    --end)
    --if target_screen ~= nil then
    --    move_window_to_screen(win, target_screen)
    --end
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "up", function()
    spoon.WinWin:moveToScreen("up")
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "down", function()
    spoon.WinWin:moveToScreen("down")
end)

function object_detail(obj)
    local detail = ""
    for k,v in pairs(getmetatable(obj)) do
        detail = detail..k..", "
        --if type(v) ~= "function" and type(v) ~= "table" then
        --    detail = detail..k..":"..v.." "
        --end
    end
    return detail
end

function check_is_normal_window(win)
    if win:frame().h > 1 and win:frame().w > 1 then
        return true
    else
        --print(win:title(), " is not normal window", win:frame().h, " ", win:frame().w)
        return false
    end
end

function check_window_y_interleave(wina, winb)
    if not (check_is_normal_window(wina) and check_is_normal_window(winb)) then
        return true
    end
    local f1 = wina:frame()
    local f2 = winb:frame()
    if f1.y > f2.y then
        f1, f2 = f2, f1
    end
    if f2.y - f1.y >= f1.h then
        return false
    else
        return true
    end
end


function check_window_x_interleave(wina, winb)
    if not (check_is_normal_window(wina) and check_is_normal_window(winb)) then
        return true
    end
    local f1 = wina:frame()
    local f2 = winb:frame()
    if f1.x > f2.x then
        f1, f2 = f2, f1
    end
    if f2.x - f1.x >= f1.w then
        return false
    else
        return true
    end
end

function check_window_interleave(wina, winb)
    local f1 = wina:frame()
    local f2 = winb:frame()
    if f1.x > f2.x then
        f1, f2 = f2, f1
    end
    if f2.x - f1.x >= f1.w then
        return false
    else
        if f1.y <= f2.y then
            if f2.y < f1.y + f1.h then
                return true
            else
                return false
            end
        else
            if f1.y < f2.y + f2.h then
                return true
            else
                return false
            end
        end
    end
end

function windows_titles(win_table)
    local titles = ""
    for _,v in pairs(win_table) do
        titles = titles..v:title().."\n"
    end
    return titles
end


function calc_distance(win_a, win_b)
    local x1 = win_a:frame().x
    local w = win_a:frame().w
    local x2 = win_b:frame().x
    if win_a:frame().x > win_b:frame().x then
        x1 = win_b:frame().x
        w = win_b:frame().w
        x2 = win_a:frame().x
    end
    local y1 = win_a:frame().y
    local h = win_a:frame().h
    local y2 = win_b:frame().y
    if win_a:frame().y > win_b:frame().y then
        y1 = win_b:frame().y
        h = win_b:frame().h
        y2 = win_a:frame().y
    end
    a = math.max(0, x2 - x1 - w)
    b = math.max(0, y2 - y1 -h)
    
    return math.sqrt(a*a + b*b)

end

hs.hotkey.bind({"cmd","ctrl"}, "H", function()
    local all_wins = hs.window.orderedWindows()
    local min_dis = 999999999999
    local win = hs.window.frontmostWindow()
    local wins = hs.fnutils.filter(all_wins, function(one_win)
        if check_window_x_interleave(win, one_win) then
            return false
        elseif one_win:frame().x + one_win:frame().w <= win:frame().x then
            dis = calc_distance(win, one_win)
            if min_dis > dis then
                min_dis = dis
            end
            return true
        else
            return false
        end
    end)
    target_win = hs.fnutils.find(wins, function(one_win)
        if not check_is_normal_window(one_win) then
            return false
        end
        if calc_distance(win, one_win) == min_dis then
            return true
        else
            return false
        end
    end)
    if target_win ~= nil then
        target_win:focus()
        hs.alert.show(target_win:title())
    else
        hs.alert.show("no target window")
    end
end)

hs.hotkey.bind({"cmd","ctrl"}, "L", function()
    local all_wins = hs.window.orderedWindows()
    local min_dis = 9999999999
    --print("all_wins")
    --for key, val in pairs(all_wins) do
    --    print(key, val, val:frame().x, val:frame().y)
    --end
    local win = hs.window.frontmostWindow()
    local wins = hs.fnutils.filter(all_wins, function(one_win)
        if check_window_x_interleave(win, one_win) then
            return false
        elseif one_win:frame().x >= win:frame().x + win:frame().w then
            dis = calc_distance(win, one_win)
            if min_dis > dis then
                min_dis = dis
            end
            return true
        else
            return false
        end
    end)
    target_win = hs.fnutils.find(wins, function(one_win)
        if not check_is_normal_window(one_win) then
            return false
        end
        if calc_distance(win, one_win) == min_dis then
            return true
        else
            return false
        end
    end)
    if target_win ~= nil then
        target_win:focus()
        hs.alert.show(target_win:title())
    else
        hs.alert.show("no target window")
    end
end)

hs.hotkey.bind({"cmd","ctrl"}, "K", function()
    local all_wins = hs.window.orderedWindows()
    local min_dis = 9999999
    local win = hs.window.frontmostWindow()
    local wins = hs.fnutils.filter(all_wins, function(one_win)
        if check_window_y_interleave(win, one_win) then
            return false
        elseif one_win:frame().y + one_win:frame().h <= win:frame().y then
            dis = calc_distance(win, one_win)
            if min_dis > dis then
                min_dis = dis
            end
            return true
        else
            return false
        end
    end)
    target_win = hs.fnutils.find(wins, function(one_win)
        if not check_is_normal_window(one_win) then
            return false
        end
        if calc_distance(win, one_win) == min_dis then
            return true
        else
            return false
        end
    end)
    if target_win ~= nil then
        target_win:focus()
        hs.alert.show(target_win:title())
    else
        hs.alert.show("no target window")
    end
end)

hs.hotkey.bind({"cmd","ctrl"}, "J", function()
    local all_wins = hs.window.orderedWindows()
    local min_dis = 9999999
    local win = hs.window.frontmostWindow()
    local wins = hs.fnutils.filter(all_wins, function(one_win)
        if check_window_y_interleave(win, one_win) then
            return false
        elseif win:frame().y + win:frame().h <= one_win:frame().y then
            dis = calc_distance(win, one_win)
            if min_dis > dis then
                min_dis = dis
                -- print(one_win:title(), ": min_dis = ", min_dis, "dis = ", dis)
            end
            return true
        else
            return false
        end
    end)
    target_win = hs.fnutils.find(wins, function(one_win)
        if not check_is_normal_window(one_win) then
            return false
        end
        if calc_distance(win, one_win) == min_dis then
            return true
        else
            return false
        end
    end)
    if target_win ~= nil then
        target_win:focus()
        hs.alert.show(target_win:title())
    else
        hs.alert.show("no target window")
    end
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "P", function()
    local win = hs.window.frontmostWindow()
    print(win:title(), " ", win:frame().x, " ", win:frame().y, " ", win:frame().w, " ", win:frame().h)

end)

hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
    hs.application.open("iTerm")
end)

--save window position
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "S", function()
    local all_wins = hs.window.orderedWindows()
    io.output(os.getenv("HOME") .. "/.hammerspoon/win_pos.json")
    --print("save win_pos\n")
    for k, win in pairs(all_wins) do
        local win_pos = string.format("%d %d %d %d %d\n", win:id(), win:frame().x, win:frame().y, win:frame().w, win:frame().h)
        --print(win_pos)
        io.write(win_pos)
    end
    io.flush()
    io.close()
    hs.alert.show("Win Pos Saved")
end)

--load window position
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "A", function()
    local all_wins = hs.window.orderedWindows()
    io.input(os.getenv("HOME") .. "/.hammerspoon/win_pos.json")
    --print("loaded win_pos\n")
    local win_pos = {}
    while true do
        local id, x, y, w, h = io.read("*number", "*number", "*number", "*number", "*number")
        if not id then
            break
        end

        local one_win_pos = string.format("%d %d %d %d %d\n", id, x, y, w, h)
        --print(one_win_pos)
        win_pos[id] = {x = x, y = y, w = w, h = h}
    end
    for k, win in pairs(all_wins) do
        if win_pos[win:id()] then
            local f = win:frame()
            f.x = win_pos[win:id()].x
            f.y = win_pos[win:id()].y
            f.w = win_pos[win:id()].w
            f.h = win_pos[win:id()].h
            local new_pos = string.format("%d %d %d %d %d\n", win:id(), f.x, f.y, f.w, f.h)
            --print(new_pos)
            win:setFrame(f)
        end
    end
    hs.alert.show("Win Pos Loaded")
end)


function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
    hs.reload()
    hs.alert.show("Config loaded")
end)

hs.hotkey.bind({"cmd","ctrl", "shift"}, "I", function()
    local win = hs.window.frontmostWindow()
    if win ~= nil then
        hs.alert(win:title())
    end
end)

hs.screen.watcher.new(function()
    local all_screens = hs.screen.allScreens()
    hs.notify.new({title="screen watch", informativeText="screen num = "..#all_screens}):send()

end):start()

function change_mac_proxy()
    print("change_mac_proxy")
    hs.application.launchOrFocus("Charles")
    local charles = hs.appfinder.appFromName("Charles")

    local str_mac_proxy = {"Proxy", "macOS Proxy"}
    mac_proxy = charles:findMenuItem(str_mac_proxy)

    if (mac_proxy) then
        if (mac_proxy["ticked"]) then
            charles:selectMenuItem(str_mac_proxy)
            hs.alert.show("disable mac proxy")
        else
            charles:selectMenuItem(str_mac_proxy)
            hs.alert.show("enable mac proxy")
        end
    end
end
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "m", change_mac_proxy)


hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
