# Amazon-~~D~~Bash
[![Build Status](https://travis-ci.org/maxisme/amazon-bash.svg?branch=master)](https://travis-ci.org/maxisme/amazon-bash)

This script will execute around 2-3 seconds after the click vs the nodejs alternative that are called when the button flashes red (about 10 seconds after being clicked). It is also extremely light weight as most linux distros have the packages installed already vs nodejs which is a huge library.
## Instructions

### Amazon app
When you receive your brand spanking new Dash Button set it up using the Amazon app, which is available for iOS and Android:

 - On the app go to **Your Account** -> **Set up a new device**.
 - Select **Dash Button** and follow the multiple instructions until you are prompted to select a product - **! Do not select a product !**.

### Finding the MAC address of the Dash Button
We need to first get a list of OUIs _(Organizationally Unique Identifier)_ for amazon products.

```
wget https://raw.githubusercontent.com/maxisme/amazon-bash/master/ieee-oui.txt
```

Now you should:
- Run this as root

  ```
  $ while :; do arp-scan --localnet -O ieee-oui.txt | grep 'Amazon'; done
  ```

- Click the Dash Button.

  This should output the `MAC` address (in my case: *50:f5:da:6a:f3:2c*) of the Dash.
  <img src="https://i.imgur.com/UCZXIcc.png">
- `ctrl-c` to exit loop.
- `rm ieee-oui.txt` to delete the list.


### Using amazon-bash.sh

You can use either `amazon-bash.sh` or `amazon-bash-wifi.sh`:
- `amazon-bash.sh` is for use when you **do not** have a wifi dongle.
- `amazon-bash-wifi.sh` is for when you do (the latter has a lot faster reaction speed). This method also requires that you install `aircrack-ng`.

Within the scripts you need to update the `MAC` variable to the one we found earlier.

And also you need to update the `onClick` function to include what you want to happen on the click. Some ideas:

 - Use [Notifi](https://github.com/maxisme/notifi) to send you a push notification.
 - Run a [slack script](https://api.slack.com/incoming-webhooks).

Also a reminder that if you want this script to run permanently:
 1. Make the script executable `chmod +x /path/to/amazon-bash-wifi.sh`
 2. Add *@reboot /path/to/amazon-bash-wifi.sh* to your crontab

___

# My weird ~~purchase~~ of a Dash Button
I bought a [Dash Button](https://www.amazon.co.uk/b?ie=UTF8&node=10833773031) for £4.99 not knowing that you were limited to the product the sticker shows (I bought it judging on the best available logo, which turned out to be [Ariel](https://www.amazon.co.uk/gp/product/B01I29J290/ref=oh_aui_detailpage_o02_s00?ie=UTF8&psc=1)). As I am a student I cannot actually afford the luxury of *Ariel washing capsules* but on the other hand as I am a **Computer Science** Student I could have done with [Listerine](https://www.amazon.co.uk/Amazon-JK29LP-Listerine-Dash-Button/dp/B01I29BJTQ/ref=pd_sim_570_8?_encoding=UTF8&psc=1&refRID=2FYAWEHFRTBMTR5MZRYP) 😉. Anyway I [told this to amazon](https://www.amazon.co.uk/gp/help/contact-us/general-questions.html) who refunded me the £4.99 immediately and when I asked twice if I needed to do anything more (i.e. return the device) they changed the subject. So now I have a free doorbell. Thank you Amazon.
