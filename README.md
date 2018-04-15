# jetson-config
Jetson configuration files for the Stanford Mars Rover. In general, most changes will be made by running the flash script (in the top-level directory of this repo) as follows:

`./flash <profile> mmcblk0p1`

The files provided make the following modifications:

### Disable Serial Debug Output ###

In `p2771-0000.conf.common`, change 

```
CMDLINE_ADD="console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0";
```
to remove `console=ttyS0,115200n8` so that it reads as follows:
```
CMDLINE_ADD="console=tty0 OS=l4t fbcon=map:0 net.ifnames=0";
```

This change was originally pulled from a [Connect Tech help page](http://connecttech.com/resource-center/kdb347-reassigning-disable-serial-debug-connect-tech-tx1-carriers/), though note that the page is now out of date.

### Fix USB 2.0 and USB 3.0 on J120 Carrier Board ###
The following files in `64_TX2/Linux_for_tx2/bootloader/t186ref/BCT` were pulled from the Auvidea website:
- `tegra186-mb1-bct-pmic-quill-p3310-1000-c01.cfg`
- `tegra186-mb1-bct-pmic-quill-p3310-1000-c02.cfg`
- `tegra186-mb1-bct-pmic-quill-p3310-1000-c03.cfg`
- `tegra186-mb1-bct-pmic-quill-p3310-1000-c04.cfg`
The files are modifications to the Boot Configuration Table (BCT) of the Jetson and also require the Jetson to be re-flashed.

There are also a few changes to the Device Tree Blob (DTB) necessary. The following files in `64_TX2/Linux_for_tx2/kernel/dtb` were pulled from the [Auvidea firmware page](https://auvidea.com/firmware/):
- `tegra186-quill-p3310-1000-a00-00-base.dtb`
- `tegra186-quill-p3310-1000-c03-00-base.dtb`
- `tegra186-quill-p3310-1000-c03-00-dsi-hdmi-dp.dtb`

In order for these changes to take effect, you must execute the following:
```
sudo ./flash.sh -r -k kernel-dtb jetson-tx2 mmcblk0p1
```
Then, copy the Image and zImage into the `\boot` folder on the TX2. Finally, copy the kernel-modules into the `/lib/modules` folder on the TX2  
TODO ^ elaborate on previous


## Kernel Modules ##
Note that these are not handled by the files in this repo. Note that we use the following additional modules (which will likely require you to recompile the kernel onboard using (buildTX2Kernel)[https://github.com/jetsonhacks/buildJetsonTX2Kernel]):
- `mttcan`

We also compile with the option `CONFIG_USB_ACM` (USB Modem (CDC ACM) support).
