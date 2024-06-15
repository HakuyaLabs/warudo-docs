---
sidebar_position: 1000
---

# Debugging

Scripts not working as intended? Here's some debugging tips!

## Restart Warudo

As cliché as it sounds, restarting Warudo can solve a lot of issues, especially when your mods or scripts are hot-reloaded. Always try this first if you encounter a head-scratching issue.

## Logging

You can use Unity's `Debug.Log` to print messages to the console as usual. You can access the logs folder by using **Menu → Open Logs Folder**. The `Player.log` file contains the current session's logs, while `Player-prev.log` contains the logs from the previous session.

## Enable Full Build Logs

If you are creating a [plugin mod](plugin-mod), we recommend to set **Log Level** to All and uncheck **Clear Console On Build** in the Mod Settings window:

![](/doc-img/en-mod-13.png)

Please also refer to the [Modding](../modding/mod-sdk#custom-scripts) documentation.

## Join the Discord

If you are still having trouble, feel free to ask for help on our [Discord](https://discord.gg/warudo). We have a dedicated **#plugins-scripting** channel for anything related to scripting, and experienced folks there would be happy to help you diagnose the issue!
