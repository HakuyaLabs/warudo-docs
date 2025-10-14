---
sidebar_position: 30
title: Translating Warudo
description: Contribute to Warudo’s multilingual translation project
---

Warudo’s localization is powered by community contributions.  
We use [Crowdin](https://crowdin.com/project/warudoapp) to manage translations and fetch the latest versions during each release.  
Anyone is welcome to help improve or expand existing translations.

## How to Contribute

1. Create and log in to a Crowdin account.  
2. Visit the [Warudo translation project page](https://crowdin.com/project/warudoapp).  
3. Click **“Join Project”** to start contributing.  
4. Select your target language and begin translating.  
5. When you’re done, click **“Submit”** to save your work.  
6. Your translations will be reviewed and included in the next release.

:::tip  
If you’re unsure about certain terms or phrasing, use the comment feature on Crowdin to discuss with other translators or maintainers.  
:::

## File Overview

Warudo’s main translation files include:

- `Warudo.Core.json`  
  Contains core UI and shared text strings.  
  - `LANGUAGE_NAME`: The display name of the language shown in the selector (e.g., “English”).  
  - `TRANSLATOR`: The translator’s credit displayed on the “About” page.

- `editor-i18n.json`  
  Contains translations for the editor interface.

We retrieve translations directly from Crowdin when a new version is released.  
No additional submission or manual synchronization is required elsewhere.

## Translation Guidelines

- Keep terminology consistent (e.g., always translate “Scene” the same way).  
- Preserve variables and placeholders such as `{0}` or `%s`.  
- Do **not** translate file paths, commands, or code snippets.  
- Preview your translation in context to ensure it fits naturally and displays correctly.  

## Review and Updates

All submitted translations are reviewed by maintainers or proofreaders.  
Approved translations will be included in the next Warudo release.  
If you’d like to become a lead translator for your language, you can leave a message on Crowdin or reach out through community channels.

## Requesting Additional Languages

If your preferred language isn’t currently available, you can request it directly on the Crowdin project page.  
Once approved, it will be added so the community can start contributing translations for it.  
You can also join our [official Discord server](https://discord.gg/warudo) to connect with other users and translators, and coordinate new language support together.
