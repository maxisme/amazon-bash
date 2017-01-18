# amazon-bash

## Instructions

### Amazon app
When you receive your brand spanking new amazon-dash button set it up using the Amazon app, which is available for iOS and Android.
On the app go to Your Account -> Set up a new device. Select "Dash Button" and follow the instructions until you are prompted to select a product - **Do not select a product**.

### Finding the mac address of the amazon-dash button
First we need to update the OUI - _organizationally unique identifier is a 24-bit number that uniquely identifies a vendor, manufacturer, or other organization._

```
$ wget https://raw.githubusercontent.com/maxisme/amazon-bash/master/ieee-oui.txt
```


Now run this to find the mac address of the amazon-dash:

```
$ while [ true ];do arp-scan --localnet -O ieee-oui.txt | grep 'Amazon'; done
```
<sub>There is definitely a better way to do this without having to install a package. You can now delete ieee-oui.txt `rm ieee-oui.txt`</sub>

Now click the amazon-dash button. And the MAC address should appear.

IMAGE

### Using amazon-bash

You can use either `amazon-bash.sh` or `amazon-bash-wifi.sh`
`amazon-bash.sh` is for use when you do not have a wifi dongle and `amazon-bash-wifi.sh` is for when you do (the latter has a lot faster reaction speed).
