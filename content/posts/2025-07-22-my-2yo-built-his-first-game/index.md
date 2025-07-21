---
title: "My 2-Year-Old Built His First Video Game in 8 Minutes (Here's How)"
date: "2025-07-21T05:38:16-05:00"
draft: false
description: "How a 2-year-old used VSCode and Cline to create a browser game with nothing but natural language—and what it taught us about the future of coding education."
categories: ["AI-Assisted Learning & Creation"]
tags: ["early-childhood-tech", "ai-tools", "parent-developers", "systems-thinking", "workflow"]
---

My almost-3-year-old has been having a blast with [GCompris](https://gcompris.net/) educational games and we recently showed him how to make simple sprites move around in Scratch. One day, he announced that he wanted to “make a red car game.”

Not play a red car game. *Make* one.

This was something I’d been curious about—could a toddler actually use AI tools to create something real?

Spoiler alert: [he absolutely could](https://madladstudios.com/mad-car-game.html).

## Setting Up the Magic

The beautiful thing about modern AI coding tools is that they’ve eliminated the biggest barrier between kids and creation: syntax. My son doesn’t need to understand semicolons or bracket placement—he just needs to be able to describe what he wants.

Here’s exactly how we set up his development environment in about 10 minutes:

1. Sign up for [Github](https://github.com/) (Yes, my toddler has his own Github account ❤️)
2. [Download Visual Studio Code](https://code.visualstudio.com/Download)
3. [Install the Cline extension](https://docs.cline.bot/getting-started/installing-cline) (an AI coding assistant that can use your command line and editor)

### Quick Setup Script

If you want to try this yourself, I’ve created a setup script that handles the tedious parts:

```bash
#!/bin/bash
# Quick VSCode + Cline setup for family coding
# Run with: curl -sSL https://raisingpixels.dev/teaching-my-toddler-to-code-building-browser-games-with-ai/setup-family-coding.sh | bash

echo "🚀 Setting up family coding environment..."

# Install or update VSCode
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v code &> /dev/null; then
        echo "✅ VSCode already installed, checking for updates..."
        # VSCode auto-updates, but we can trigger a check
    else
        echo "📦 Installing VSCode for macOS..."
        curl -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" -o vscode.zip
        unzip vscode.zip
        mv "Visual Studio Code.app" /Applications/
        rm vscode.zip
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install code
else
    echo "⚠️  Please install VSCode manually from https://code.visualstudio.com/"
    echo "   Then re-run this script to continue with Cline setup"
    exit 1
fi

# Install Cline extension
echo "🤖 Installing Cline extension..."
code --install-extension saoudrizwan.claude-dev

# Create family coding directory
mkdir -p ~/family-coding-projects
cd ~/family-coding-projects
code ~/family-coding-projects

echo "✅ Setup complete! Time to start creating!"
echo "💡 Pro tip: Try the prompt in the blog post to make your first game together"
```

### Family-Friendly VSCode Settings

I also created a settings configuration that makes VSCode more approachable for family coding sessions. Save this as `.vscode/settings.json` in your projects folder:

```json
{
  "workbench.colorTheme": "Default Light+",
  "editor.fontSize": 16,
  "editor.lineHeight": 1.6,
  "editor.wordWrap": "on",
  "editor.minimap.enabled": false,
  "editor.renderWhitespace": "none",
  "breadcrumbs.enabled": false,
  "workbench.activityBar.visible": true,
  "workbench.sideBar.location": "left",
  "explorer.compactFolders": false,
  "editor.suggest.showSnippets": false,
  "extensions.ignoreRecommendations": true,
  "workbench.startupEditor": "none",
  "window.zoomLevel": 1,
  "editor.formatOnSave": true,
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "workbench.editor.enablePreview": false,
  "editor.accessibilitySupport": "on",
  "workbench.tips.enabled": false,
  "update.mode": "start",
  "telemetry.telemetryLevel": "off"
}
```

These settings prioritize:

- **Large, readable text** (because tiny hands mean imprecise clicking)
- **Simplified interface** (fewer distractions)
- **Auto-save everything** (because toddlers don’t think about Cmd+S)
- **Accessibility features** (better for young eyes and motor skills)

## The Magic Moment

With VSCode and Cline installed, we explained it like this: “You type what you want, and the code helper will try to make it for you.”

His eyes lit up. “Make a red car game! Tell the computer to make a red car game right now!”

So, we did. If you want to try it yourself, feel free to copy this prompt for your own experiments:

```txt
Create a fun browser-based red car game for a toddler. The game should:

- Feature a bright red car that the player controls
- Use simple key controls
- Have cheerful colors and a playful design
- Include some kind of goal or objective that's easy to understand
- Work smoothly in a web browser

Make it joyful and engaging for a 2-3 year old who's just learning to use computers!
```

That’s it. No technical specifications, no framework requirements, no architectural decisions. Just a description of what would make a toddler happy.

## What Happened Next

Cline got to work, and my son watched, mesmerized, as code appeared on the screen. He didn’t understand the syntax, but he could see *something* was being built. Every few minutes, he’d ask, “Can we play the red car game now?”

About eight minutes later, Cline had created a complete browser-based side-scrolling game with:

- A bright red car sprite
- Spacebar control for jumping
- Obstacles to jump over
- A scoring system and high score tracking

When our toddler saw HIS red car moving around the screen, responding to HIS key presses, the joy on his face was absolutely priceless.

## The Unexpected Lessons

### For Him: Computers Are Creative Partners

I watched our toddler's relationship with the computer shift in real time. Before this, computers were things that showed him videos or let him play with educational games that someone else made.

Now? The computer became a creative partner. He understood that he could describe an idea and the computer could help him build it. That’s a fundamentally different relationship with technology: from consumer to creator.

### For Me: The Power of Natural Language Programming

As a developer, I was struck by how naturally he took to “prompt engineering.” He intuitively understood that being specific helped (“I want the car to be RED, not blue”), and he started making feature requests (“Can we add a truck? Can we make it a digger?”).

He was doing product management without knowing it.

### For Our Family: Systems That Enable Creativity

This experience reinforced something I’ve been thinking about a lot—the importance of building systems that make good things automatic and easy. By having Cline set up and ready to go, we could capitalize on future moments of creative inspiration. We spent an afternoon (and more in the days to follow) creating games that kids all over the world can play.

## The Game Itself

You can [play the actual game we created](https://madladstudios.com/mad-car-game.html) right in your browser. Fair warning: it’s optimized for toddler joy, not sophisticated gameplay. But that’s exactly the point.

If I were to do this again, I’d specifically ask for mobile touch controls in the initial prompt. Right now it only works on desktop with the keyboard spacebar.

## What This Means for Early Childhood Education

This experience has me thinking about the bigger implications. We’re at a unique moment in history where the gap between imagination and creation is smaller than it’s ever been. Kids who grow up with AI-assisted development tools will have fundamentally different relationships with technology.

They won’t see software as mysterious black boxes created by distant experts. They’ll see it as a medium for expression, like drawing or building with blocks, but infinitely more powerful.

This sits perfectly at the intersection of several things I care deeply about:

**Systems Thinking**: We created an environment where creativity could flourish without technical barriers.

**Beautiful Software**: The end result wasn’t just functional—it was joyful and delightful.

**AI-Assisted Learning**: We used cutting-edge tools to make complex creation accessible to a toddler.

**Home + Code Philosophy**: Setting this up in our play room, on the same computer where he watches videos, gave us a new creative activity in the literal center of our home. Technology integrated seamlessly into our family life instead of requiring a separate “coding space.”

## Try This With Your Own Kids

If you want to experiment with this approach:

1. **Start with their interests**: What are they already excited about? Cars, dinosaurs, princesses, construction vehicles?
2. **Use the setup script above** to get VSCode and Cline ready.
3. **Let them drive the prompting**: Guide them to be specific, but let their imagination lead.
4. **Celebrate the process, not just the product**: The magic is in watching them realize they can create, not in building the perfect game.
5. **Build on success**: Once they’ve made one thing, they’ll want to make ten more things.

## What’s Next

My son immediately started planning his next projects—you can play all the games we’re building at [madladstudios.com](https://madladstudios.com/).

We’re living through a remarkable moment where tools of creation are becoming accessible to anyone who can describe what they want. For parents, this opens up entirely new ways to nurture creativity and problem-solving without requiring intensive time spent on the complexities of the technology.

For kids, it means growing up in a world where the question isn’t “how do I learn to code?” but “what do I want to create today?”

And for families, it’s a chance to build together, learn together, and experience the joy of creating core memories around technology.

---

**Resources mentioned:**

- [GCompris Educational Games](https://gcompris.net/)
- [Cline VSCode Extension](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev)
- [Mad Lad Studios Games for Kids](https://madladstudios.com/)
- [Setup script](setup-family-coding.sh) and [Visual Studio Code settings](/teaching-my-toddler-to-code-building-browser-games-with-ai/#family-friendly-vscode-settings)
