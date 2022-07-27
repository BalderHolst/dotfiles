runner = require("myscripts.runner")

vim.keymap.set("n", "Å", function () runner.toggle() end)
