<h1 align='center'>Sched</h1>
<p align='center'>
    <b><a href='https://discord.esx-framework.org/'>Discord</a> - <a href='https://esx-framework.org/'>Website</a> - <a href='https://documentation.esx-framework.org/legacy/installation'>Documentation</a></b>
</p>

A simple, but vital, resource that allows resources to run tasks at specific intervals.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Example Usage](#example-usage)
- [Events](#events)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. **Clone the repository or download the latest release.**

   ```sh
   git clone https://github.com/ManiWizard/Sched.git
   ```

2. **Place the `sched` directory in your FiveM server's `resources` directory.**

3. **Add the following line to your `server.cfg` to ensure the resource starts:**

   ```plaintext
   start sched
   ```

4. **Restart your FiveM server or start the resource using the console command:**

   ```plaintext
   start sched
   ```

## Usage

### Registering Jobs

You can register jobs to be run at specific times by using the `cron:registerJob` event. The event parameters are:

- `hour` (number): The hour at which the job should run (0-23).
- `minute` (number): The minute at which the job should run (0-59).
- `callback` (function): The function to be executed.
- `day` (optional, number): The day of the week on which the job should run (1-7, where 1 is Monday).

### Example

```lua
-- Execute task at 5:10 every day
TriggerEvent('cron:registerJob', 5, 10, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute)
end)

-- Execute task every Monday at 18:30
TriggerEvent('cron:registerJob', 18, 30, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute .. ' on Monday')
end, 1)
```
