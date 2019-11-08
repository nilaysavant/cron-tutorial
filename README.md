# CRON Tutorial READ-ME

- Run the following to access your `crontab`:

    ```bash
    crontab -e
    ```

- Make sure to setup your environment as CRON comes with no environment of its own:

    ```bash
    SHELL=/bin/bash
    PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
    MAILTO=root@example.com # will only work if email client is configured
    ```

- Activate a separate log file exclusive for CRON: [Ask Ubuntu Link](https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log)

- Or check from system-log:

    ```bash
    grep CRON /var/log/syslog
    ```

---

## Using `notify-send` for notifications in `CRON`

- Add the following line to the start of your scripts:

    ```bash
    eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";
    ```

    >Source: [Ask Ubuntu Link](https://askubuntu.com/questions/298608/notify-send-doesnt-work-from-crontab/346580#346580)

    This will make **notify-send** to work in `CRON` executed scripts.

---

## Log your script output to a log file:

```bash
0 2 9 11 * /path/to.sh | ts &>> /path/to.log
```

- The paths need to be `full paths` and **not** *relative*.

- `&>>` will append to the log file.

- `ts` will add time-stamp to logs.

- The above command has a format of :
  
    ```bash
    m h  dom mon dow   command
    ```

- Thus it will execute:

    ```bash
    0 2 9 11 * /path/to.sh | ts &>> /path/to.log
    ```

    `2`:`00` AM on `9`th `Nov` on any (`*`) `day of week`(dow)

---

## Time Format Abbreviations:

- `dow`: day of week(number)
- `dom`: day of month(number)
- `mon`: month (number)
- `m`: month
- `h`: hour

---

## Other Tutorial Links

- [tecadmin](https://tecadmin.net/crontab-in-linux-with-20-examples-of-cron-schedule/)
- [serverfault](https://serverfault.com/questions/449651/why-is-my-crontab-not-working-and-how-can-i-troubleshoot-it)
- [Opensource.com](https://opensource.com/article/17/11/how-use-cron-linux)

