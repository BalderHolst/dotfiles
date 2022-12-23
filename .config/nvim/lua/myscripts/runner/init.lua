

function split(str, sep)
    local t = {}
    for part in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(t, part)
    end
    return t
end

function get_current_extension()
    local path = vim.api.nvim_buf_get_name(0)
    local parts = split(path, ".")
    local ext = parts[#parts]
    return(ext)
end


local ext = get_current_extension()

if ext == "py" then
    return(require("myscripts.runner.python"))
elseif ext == "ino" then
    return(require("myscripts.runner.arduino"))
end


