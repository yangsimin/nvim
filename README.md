# VSCode Neovim ShortCuts

| Shortcut                     | Description                                  |
| ---------------------------- | -------------------------------------------- |
| **Commands(:)**              |
| :w                           | Save current file                            |
| x/wq                         | save and close active tab                    |
| xa/wqa                       | save and close all tabs                      |
| tabo[nly]                    | 只保留当前标签页，关闭其他标签页             |
| changes                      | 查看修改记录列表                             |
| '<,'>normal @{register}      | 对选中的区域，执行 register 录制的宏         |
| put {register}               | 将 register 录制的宏粘贴到当前行的下方       |
| **Keybindings(normal mode)** |
| W/E/B/gE                     | 按字串移动                                   |
| W/E/ ZZ                      | save and close active tab                    |
| W/E/ (/)                     | 跳转到上一句/下一句开头                      |
| W/E/ {/}                     | 跳转到上一段/下一段开头                      |
| gt                           | switch next tab                              |
| gT                           | switch previous tab                          |
| gh                           | show hover                                   |
| gd                           | go to definition                             |
| gD                           | peek definition                              |
| `<C-w>`gd                    | go to definition in new window               |
| gR                           | enter replace mode                           |
| gj                           | move down in screen line                     |
| gk                           | move up in screen line                       |
| g~                           | 反转大小写                                   |
| gu                           | 转换为小写                                   |
| gU                           | 转换为大写                                   |
| g,                           | 正向跳转上一次修改位置                       |
| g;                           | 反向跳转上一次修改位置                       |
| gi                           | 回到上一次退出插入模式的位置，并进入插入模式 |
| gp                           | 粘贴，并且把光标位置移到粘贴的文本结尾       |
| `.                           | 跳转到上一次修改行的行首                     |
| `^                           | 跳转到上一次退出插入模式时光标所在的位置     |
| '.                           | 跳转到上一次修改行的句首                     |
| '^                           | 跳转到上一次退出插入模式时光标所在的句首     |
| ""                           | 使用 unnamed register                        |
| "_                           | 使用 black hole register                     |
| "0                           | 使用 recent yard register                    |
| "=                           | 使用 expression register                     |
| "+                           | 使用系统剪贴板                               |
| ".                           | 保存着上次插入的文本                         |
| >>                           | 增加缩进                                     |
| >G                           | 增加缩进到文档末尾                           |
| ==                           | 自动缩进                                     |
| H/M/L                        | move cursor to top/middle/bottom             |
| zz                           | reveal center                                |
| zt                           | reveal top                                   |
| zb                           | reveal bottom                                |
| `<C-i>`                      | navigate forward                             |
| `<C-o>`                      | navigate back                                |
| `<C-w>`n                     | split new window                             |
| `<C-w>`q                     | close active tab                             |
| `<C-w>`s                     | split editor dowm                            |
| `<C-w>`v                     | split editor right                           |
| `<C-w>`o                     | all editors in one                           |
| `<C-w>`=                     | equally divide editor width                  |
| `<C-w>`_                     | toggle editor width                          |
| `<C-w>`+                     | increase editor height                       |
| `<C-w>`-                     | decrease editor height                       |
| `<C-w>`>                     | increase editor width                        |
| `<C-w>`<                     | decrease editor width                        |
| `<C-w>`j                     | navigate down                                |
| `<C-w>`k                     | navigate up                                  |
| `<C-w>`h                     | navigate left                                |
| `<C-w>`l                     | navigate right                               |
| `<C-w><C-j>`                 | move editor to below group                   |
| `<C-w><C-k>`                 | move editor to above group                   |
| `<C-w><C-h>`                 | move editor to left group                    |
| `<C-w><C-l>`                 | move editor to right group                   |
| `<C-w><C-w>`                 | focus next group                             |
| `<C-w>`W                     | focus previous group                         |
| `<C-w>`p                     | focus previous group                         |
| **Keybindings(insert mode)** |
| `<C-r>`{register}            | paste text from the {register}               |
| `<C-h>`                      | same as backspace                            |
| `<C-w>`                      | 删除前一个单词                               |
| `<C-u>`                      | 删除至行首                                   |
| `<C-j>`                      | same as enter                                |
| `<C-o>`                      | enter normal mode then back to insert mode   |
| **Keybindings(visual mode)** |
| gv                           | 重选上次的高亮选区                           |
| o                            | 切换高亮选区的活动端                         |
| **Text Objects**             |
| dip                          | 删除段落                                     |
| dgn                          | 删除下一个搜索匹配项                         |
| **Motions**                  |
| 0                            | 到行首                                       |
| ^                            | 到行首（第一个非空字符）                     |
| $                            | 行尾                                         |
| g_                           | 到行尾（最后一个非空字符）                   |
| g0                           | 到行首，当编辑器自动换行时                   |
| g^                           | 到行首（第一个非空字符），当编辑器自动换行时 |
| -                            | 光标沿着行首上移                             |
| + 或者 `<C-m>`               | 光标沿着行首下移                             |
| {count}G                     | 跳转到指定行，默认是最后一行                 |
| {count}%                     | 跳转到指定百分比的位置                       |
| **Jump Motions**             |
| `<C-i>` 或者 `<Tab>`         | navigate forward                             |
| `<C-o>`                      | navigate back                                |


### Plugins
* nvim-surround
  * 修改: cs{old}{new}
    * cs'"
    * csq"
    * csqb
  * 删除: ds{old}
  * 增加: ys{range}{new}
  * 增加(visual mode): S{new}
  * 别名:
    * b: ()
    * B: {}
    * r: []
    * q: '', "",``
    * t: `<tag></tag>`
    * s: all
