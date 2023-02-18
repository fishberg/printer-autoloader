# printer-autoloader
Simple script that automates printing from an autoload directory on Linux using `lpr`.

## Adding Printers
1. Add printer to system so it shows up in `lpstat -p -d`
    * OS GUI (Ubuntu 20.04): `Settings > Printers > Add...`
    * CUPS Web Browser Interface: [http://localhost:631/](http://localhost:631/)
2. Create the autoload directory structure in `./printers/` for your desired printer(s)
    * `PRINTER_NAME="MY_PRINTER_NAME"; mkdir -p printers/$PRINTER_NAME/{autoload,completed}`
3. Place files to be printed in `./printers/$PRINTER_NAME/autoload`
4. Run `./run_print_autoload.bash`
    * Files in `autoload` folders will have print jobs sent to their respective printers.
    * Files will then be moved to their respective `completed` folder.

## TODO
* `inotify` script to autorun `run_print_autoload.bash` on new file
* `run_print_autoload.bash` gracefully ignores incorrectly formatted folders

## Useful Commands/Links
See available printers and default printer:
```
lpstat -p -d
```

Set default printer:
```
lpoptions -d printer
```

CUPS Default URL:
```
http://localhost:631/
```

* [lpr CUPS Documentation](https://www.cups.org/doc/options.html)
