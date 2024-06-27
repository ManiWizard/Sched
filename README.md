<div align="center">
# Sched
    
**[Discord](https://discord.gg/K8aKgT9KUS) - [Website](https://fivem.immani.net/) - [Documentation](https://documentation.fivem.immani.net/Sched)**
</div>



A simple, but vital, resource that allows resources to run tasks at specific intervals.

## Table of Contents

*   [Installation](#installation)
*   [Usage](#usage)
*   [Configuration](#configuration)
*   [Example Usage](#example-usage)
*   [Events](#events)
*   [Contributing](#contributing)
*   [License](#license)

## Installation

1.  Clone the repository or download the latest release.

```
git clone https://github.com/ManiWizard/Sched.git
```

3.  Place the `sched` directory in your FiveM server's `resources` directory.
4.  Add the following line to your `server.cfg` to ensure the resource starts:

```
start sched
```

6.  Restart your FiveM server or start the resource using the console command:

```
start sched
```

## Usage

### Registering Jobs

You can register jobs to be run at specific times by using the `sched:registerJob` event. The event parameters are:

*   `hour` (number): The hour at which the job should run (0-23).
*   `minute` (number): The minute at which the job should run (0-59).
*   `callback` (function): The function to be executed.
*   `day` (optional, number): The day of the week on which the job should run (1-7, where 1 is Monday).

## Configuration

Currently, the resource does not require additional configuration files. All tasks are registered via the `sched:registerJob` event.

## Example Usage

```
-- Execute task at 5:10 every day
TriggerEvent('sched:registerJob', 5, 10, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute)
end)

-- Execute task every Monday at 18:30
TriggerEvent('sched:registerJob', 18, 30, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute .. ' on Monday')
end, 1)
```

## Events

### sched:registerJob

Registers a new job to be run at a specific time.

**Parameters:**

*   `hour` (number): The hour at which the job should run (0-23).
*   `minute` (number): The minute at which the job should run (0-59).
*   `callback` (function): The function to be executed.
*   `day` (optional, number): The day of the week on which the job should run (1-7, where 1 is Monday).

**Example:**

```
TriggerEvent('sched:registerJob', 12, 0, function()
    print('Task running at noon')
end)
```

## Contributing

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/your-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin feature/your-feature`).
5.  Create a new Pull Request.

## License

Sched - run tasks at specific intervals!

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

You are free to:

*   Share: copy and redistribute the material in any medium or format
*   Adapt: remix, transform, and build upon the material

Under the following terms:

*   Attribution: You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
*   NonCommercial: You may not use the material for commercial purposes.
*   ShareAlike: If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions: You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

For full license text, visit [http://creativecommons.org/licenses/by-nc-sa/4.0/](http://creativecommons.org/licenses/by-nc-sa/4.0/).

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)
