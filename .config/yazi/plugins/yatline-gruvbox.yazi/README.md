# yatline-gruvbox.yazi
Gruvbox theme for Yatline plugin.

## Illustration
> Gruvbox Dark:

![header_dark_normal](https://github.com/user-attachments/assets/8036d258-4f52-4ccf-aa9d-ca5f3249d283)
![header_dark_select](https://github.com/user-attachments/assets/d7f3a820-7e4e-4a1d-812c-9d9a09c1e7cc)
![header_dark_un-set](https://github.com/user-attachments/assets/a7767e0e-881b-4811-8778-ee790c3bfa1b)

![status_dark_normal](https://github.com/user-attachments/assets/7c747a0a-2d06-4507-9660-b95467ea0307)
![status_dark_select](https://github.com/user-attachments/assets/abe47a29-449e-4e03-8018-7fe7c4e58e6f)
![status_dark_un-set](https://github.com/user-attachments/assets/7991df03-b89b-433d-b080-0d8051454928)

> Gruvbox Light

![header_light_normal](https://github.com/user-attachments/assets/56e4b985-443c-48a1-ade3-0816df7045a3)
![header_light_select](https://github.com/user-attachments/assets/99712515-90af-4cc5-8942-162e92f3dcd0)
![header_light_un-set](https://github.com/user-attachments/assets/3740d1a0-ab5e-4f47-8480-01cfac31bff2)

![status_light_normal](https://github.com/user-attachments/assets/8cc675af-90a9-4ad6-ae24-e18b6e3f146f)
![status_light_select](https://github.com/user-attachments/assets/9c49ce88-adcd-4e38-b8ba-e344c3dd020d)
![status_light_un-set](https://github.com/user-attachments/assets/8ccf10ed-2304-4bb0-b4c5-432224f33f89)


## Installation

### General
1) Download the repository.
2) If the directory is downloaded as zip file, extract it.
3) Rename the directory as `yatline-gruvbox.yazi`
4) Open the config directory of Yazi.
5) Copy this directory into `plugins` directory.
6) Create `init.lua` file in the main Yazi config directory.
7) Open this file and copy the config to that file.

### Linux
``` bash
git clone https://github.com/imsi32/yatline-gruvbox.yazi.git ~/.config/yazi/plugins/yatline-gruvbox.yazi
```

## Usage
Copy the following config to the `init.lua` file.
``` lua
local gruvbox_theme = require("yatline-gruvbox"):setup("dark") -- or "light"
```
Then use the `theme` variable in Yatline config's theme paramater.
``` lua
require("yatline"):setup({
-- ===

	theme = gruvbox_theme,

-- ===
})
```

## Credits
- [Gruvbox Theme](https://github.com/morhetz/gruvbox)
