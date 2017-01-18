# Amazon-~~D~~Bash
[![Build Status](https://travis-ci.org/maxisme/amazon-bash.svg?branch=master)](https://travis-ci.org/maxisme/amazon-bash)

## Instructions

### Amazon app
When you receive your brand spanking new amazon-dash button set it up using the Amazon app, which is available for iOS and Android:

 - On the app go to Your Account -> Set up a new device.
 - Select "Dash Button" and follow the instructions until you are prompted to select a product - **Do not select a product**.

### Finding the MAC address of the amazon-dash button
First we need to update the OUI _(Organizationally Unique Identifier)_ - _a 24-bit number that uniquely identifies a vendor, manufacturer, or other organization by their MAC address_

```
$ wget https://raw.githubusercontent.com/maxisme/amazon-bash/master/ieee-oui.txt
```

Now you should:
- Run this as root

  ```
  $ while :; do arp-scan --localnet -O ieee-oui.txt | grep 'Amazon'; done
  ```
<sub>There is definitely a better way to do this without having to install a package.</sub><br>

- Click the amazon-dash button.

This should output the `MAC` address of the amazon-dash. `ctrl-c` to exit loop. And you can now `$ rm ieee-oui.txt`.


IMAGE

### Using amazon-bash.sh

You can use either `amazon-bash.sh` or `amazon-bash-wifi.sh`:
- `amazon-bash.sh` is for use when you **do not** have a wifi dongle.
- `amazon-bash-wifi.sh` is for when you do (the latter has a lot faster reaction speed). This method also requires that you install `aircrack-ng`.

Within the scripts you need to update the `MAC` variable to the one we found earlier.
