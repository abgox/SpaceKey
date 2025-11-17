; 使用 $ 来避免触发自己，陷入死循环
; 如果需要连续空格，先禁用 SpaceKey，输入连续空格，再启用脚本
$Space::Space

; 方向
Space & i::Up
Space & k::Down
Space & j::Left
Space & l::Right

; 换行/删除/...
Space & e::Enter
Space & b::BackSpace
Space & q::Esc
Space & Tab::+Tab

; F1-F12
Space & 1::F1
Space & 2::F2
Space & 3::F3
Space & 4::F4
Space & 5::F5
Space & 6::F6
Space & 7::F7
Space & 8::F8
Space & 9::F9
Space & 0::F10
Space & -::F11
Space & =::F12
