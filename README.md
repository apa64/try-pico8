# try-pico8

Trying out [PICO-8](https://www.lexaloffle.com/pico-8.php). All kinds of practice projects here.

## Local Dev Env

### Dir Structure and Files

- `%USERPROFILE%/pico8carts` - root_path, subdirs: git repos, `bbs`, `demos`, `games`
  - `robocopy_backup_repos.bat` - backup git repos to Google Drive home without `.git` directory
- `.../Google Drive/pico8` - install location
  - `/home` - home
  - `/desktop` - desktop
  - `pico8.bat` - start script

`pico8.bat`:

    start "pico8" /B pico8.exe -home ./home/ -desktop ./desktop/ -root_path %USERPROFILE%/pico8carts/ %*

### Editor

[Visual Studio Code](https://code.visualstudio.com/) with [pico8vscodeeditor](https://marketplace.visualstudio.com/items?itemName=Grumpydev.pico8vscodeeditor) plugin.

TODO:
- Lua formatter plugin?
- Lua lint plugin?
- BBS carts go to `pico8/home/bbs` instead of `pico8carts/bbs`!!

## CI/CD / Release Pipeline

TODO! https://github.com/apa64/try-pico8/issues/1
