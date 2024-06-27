<h1 align='center'>Sched</h1>
<p align='center'>
    <b><a href='https://discord.gg/K8aKgT9KUS'>Discord</a> - <a href='https://fivem.immani.net/'>Website</a> - <a href='https://documentation.fivem.immani.net/Sched'>Documentation</a></b>
</p>

<p>A simple, but vital, resource that allows resources to run tasks at specific intervals.</p>

<h2>Table of Contents</h2>
<ul>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#configuration">Configuration</a></li>
    <li><a href="#example-usage">Example Usage</a></li>
    <li><a href="#events">Events</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
</ul>

<h2 id="installation">Installation</h2>
<ol>
    <li>Clone the repository or download the latest release.</li>
    <pre><code>git clone https://github.com/ManiWizard/Sched.git</code></pre>
    <li>Place the <code>sched</code> directory in your FiveM server's <code>resources</code> directory.</li>
    <li>Add the following line to your <code>server.cfg</code> to ensure the resource starts:</li>
    <pre><code>start sched</code></pre>
    <li>Restart your FiveM server or start the resource using the console command:</li>
    <pre><code>start sched</code></pre>
</ol>

<h2 id="usage">Usage</h2>
<h3>Registering Jobs</h3>
<p>You can register jobs to be run at specific times by using the <code>sched:registerJob</code> event. The event parameters are:</p>
<ul>
    <li><code>hour</code> (number): The hour at which the job should run (0-23).</li>
    <li><code>minute</code> (number): The minute at which the job should run (0-59).</li>
    <li><code>callback</code> (function): The function to be executed.</li>
    <li><code>day</code> (optional, number): The day of the week on which the job should run (1-7, where 1 is Monday).</li>
</ul>

<h2 id="configuration">Configuration</h2>
<p>Currently, the resource does not require additional configuration files. All tasks are registered via the <code>sched:registerJob</code> event.</p>

<h2 id="example-usage">Example Usage</h2>
<pre><code>-- Execute task at 5:10 every day
TriggerEvent('sched:registerJob', 5, 10, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute)
end)

-- Execute task every Monday at 18:30
TriggerEvent('sched:registerJob', 18, 30, function(hour, minute)
    print('Task done at ' .. hour .. ':' .. minute .. ' on Monday')
end, 1)
</code></pre>

<h2 id="events">Events</h2>
<h3>sched:registerJob</h3>
<p>Registers a new job to be run at a specific time.</p>
<p><strong>Parameters:</strong></p>
<ul>
    <li><code>hour</code> (number): The hour at which the job should run (0-23).</li>
    <li><code>minute</code> (number): The minute at which the job should run (0-59).</li>
    <li><code>callback</code> (function): The function to be executed.</li>
    <li><code>day</code> (optional, number): The day of the week on which the job should run (1-7, where 1 is Monday).</li>
</ul>
<p><strong>Example:</strong></p>
<pre><code>TriggerEvent('sched:registerJob', 12, 0, function()
    print('Task running at noon')
end)
</code></pre>

<h2 id="contributing">Contributing</h2>
<ol>
    <li>Fork the repository.</li>
    <li>Create your feature branch (<code>git checkout -b feature/your-feature</code>).</li>
    <li>Commit your changes (<code>git commit -am 'Add some feature'</code>).</li>
    <li>Push to the branch (<code>git push origin feature/your-feature</code>).</li>
    <li>Create a new Pull Request.</li>
</ol>

<h2 id="license">License</h2>
<p>Sched - run tasks at specific intervals!</p>
<p>This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.</p>
<p>You are free to:</p>
<ul>
    <li>Share: copy and redistribute the material in any medium or format</li>
    <li>Adapt: remix, transform, and build upon the material</li>
</ul>
<p>Under the following terms:</p>
<ul>
    <li>Attribution: You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.</li>
    <li>NonCommercial: You may not use the material for commercial purposes.</li>
    <li>ShareAlike: If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.</li>
</ul>
<p>No additional restrictions: You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.</p>
<p>For full license text, visit <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">http://creativecommons.org/licenses/by-nc-sa/4.0/</a>.</p>
<p><a href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img src="https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png" alt="License: CC BY-NC-SA 4.0"></a></p>
