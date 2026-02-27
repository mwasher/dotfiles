-- Check for OS types

function is_linux()
  return vim.loop.os_uname().sysname == "Linux"
end

function is_darwin()
  return vim.loop.os_uname().sysname == "Darwin"
end

function is_nixos()
  local f = io.open("/etc/os-release", "r")
  if f then
      local content = f:read("*a")
      f:close()
      if content:lower():match("id[ =%-\"]*nixos") then
          return true
      end
  end
  return false
end
