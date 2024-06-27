-- core/main.lua

local ScheduledJobs = {}
local LastExecutionTime = nil

--- Registers a job to be run at a specific time.
-- @param hour The hour at which the job should run.
-- @param minute The minute at which the job should run.
-- @param callback The function to be executed.
-- @param day Optional day of the week (1-7, where 1 is Monday)
local function RegisterJob(hour, minute, callback, day)
    table.insert(ScheduledJobs, { hour = hour, minute = minute, callback = callback, day = day })
end

--- Gets the current Unix timestamp.
-- @return The current Unix timestamp.
local function GetCurrentTimestamp()
    return os.time()
end

--- Executes jobs that are scheduled to run at the current time.
-- @param currentTime The current Unix timestamp.
local function ExecuteScheduledJobs(currentTime)
    for _, job in ipairs(ScheduledJobs) do
        local currentDay = os.date("%w", currentTime)
        if job.day and tonumber(currentDay) ~= job.day then
            goto continue
        end

        local scheduledTime = os.time({
            year = os.date("%Y", currentTime),
            month = os.date("%m", currentTime),
            day = os.date("%d", currentTime),
            hour = job.hour,
            minute = job.minute,
            second = 0
        })

        if currentTime >= scheduledTime and (not LastExecutionTime or LastExecutionTime < scheduledTime) then
            job.callback(job.hour, job.minute)
        end

        ::continue::
    end
end

--- The main tick function to check and execute scheduled jobs.
local function Tick()
    local currentTime = GetCurrentTimestamp()

    if not LastExecutionTime or os.date("%M", currentTime) ~= os.date("%M", LastExecutionTime) then
        ExecuteScheduledJobs(currentTime)
        LastExecutionTime = currentTime
    end

    SetTimeout(60000, Tick)
end

-- Initialize the LastExecutionTime and start the tick function.
LastExecutionTime = GetCurrentTimestamp()
Tick()

-- Register a new job via the event handler.
AddEventHandler("cron:registerJob", function(hour, minute, callback, day)
    RegisterJob(hour, minute, callback, day)
end)
