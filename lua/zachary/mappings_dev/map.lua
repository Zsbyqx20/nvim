#!/usr/bin/env -S nvim -l

print("Hello?")

local Account = { balance = 0 }

function Account:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Account:deposit(v) self.balance = self.balance + v end

function Account:withdraw(v)
	if v > self.balance then
		error("insufficient funds")
	end
	self.balance = self.balance - v
end

local a = Account:new()
print(a.balance)

local b = Account:new({ balance = 100 })
-- print(b.withdraw(90))
b:withdraw(90)
print(b.balance)

local Map = { mode = "n", lhs = nil, rhs = nil, opts = { noremap = true, silent = true }, leader = 0 }

local leader_map = {
	[0] = "",
	[1] = "<leader>",
	[2] = "<localleader>",
}
function HyperMap(mode, lhs, rhs, leader, opts)
	opts = opts or {}
	opts.noremap = opts.noremap ~= nil and opts.noremap or true
	opts.silent = opts.silent ~= nil and opts.silent or true
	vim.keymap.set(mode, leader_map[leader or 0] .. lhs, rhs, opts)
end

-- HyperMap("n", "w", "<cmd>w<cr>", 1, {desc=""})
